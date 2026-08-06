#!/usr/bin/env python3
"""Validate and apply checksum-sealed Homebrew publication bundles."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import tarfile
import tempfile
import urllib.request
from pathlib import Path, PurePosixPath

SCHEMA_VERSION = 1
BUNDLE_NAME = "homebrew-publication.tar.gz"
ROOT = Path(__file__).resolve().parents[1]
REGISTRY_PATH = ROOT / "homebrew-products.json"
HEX64 = re.compile(r"^[0-9a-f]{64}$")
COMMIT = re.compile(r"^[0-9a-f]{40}$")
CORRELATION = re.compile(r"^[A-Za-z0-9._:/@+-]{1,240}$")


class PublicationError(RuntimeError):
    pass


def run(*args: str, cwd: Path | None = None, capture: bool = True) -> str:
    result = subprocess.run(args, cwd=cwd, text=True, check=True,
                            stdout=subprocess.PIPE if capture else None)
    return result.stdout.strip() if capture else ""


def load_registry(path: Path = REGISTRY_PATH) -> dict:
    data = json.loads(path.read_text())
    if data.get("schema_version") != SCHEMA_VERSION or set(data) != {"schema_version", "products"}:
        raise PublicationError("Registry schema is invalid")
    required = {"repository", "workflow", "stable_cask", "beta_cask", "tag_patterns",
                "applications", "bundle_identifiers", "artifact_patterns", "architectures",
                "minimum_macos", "stable_advances_beta"}
    casks: set[str] = set()
    repositories: set[str] = set()
    for product, entry in data["products"].items():
        if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", product) or set(entry) != required:
            raise PublicationError(f"Registry entry is invalid: {product}")
        if entry["repository"] in repositories:
            raise PublicationError("Source repositories must be unique")
        repositories.add(entry["repository"])
        for field in ("stable_cask", "beta_cask"):
            name = entry[field]
            if not re.fullmatch(r"[a-z0-9@-]+\.rb", name) or name in casks:
                raise PublicationError(f"Cask ownership is invalid: {name}")
            casks.add(name)
        if entry["architectures"] != ["arm64", "x64"]:
            raise PublicationError(f"Architecture contract is invalid: {product}")
        for channel in ("stable", "beta"):
            re.compile(entry["tag_patterns"][channel])
            re.compile(entry["artifact_patterns"][channel])
            if not entry["applications"][channel].endswith(".app"):
                raise PublicationError(f"Application identity is invalid: {product}/{channel}")
    if len(data["products"]) != 6:
        raise PublicationError("Registry must contain exactly six products")
    return data


def parse_version(value: str) -> tuple[int, int, int, int, int]:
    match = re.fullmatch(r"v?(\d+)\.(\d+)\.(\d+)(?:-beta\.(\d+))?", value)
    if not match:
        raise PublicationError(f"Unsupported version: {value}")
    major, minor, patch, beta = match.groups()
    return int(major), int(minor), int(patch), 1 if beta is None else 0, int(beta or 0)


def safe_extract(bundle: Path, destination: Path) -> None:
    with tarfile.open(bundle, "r:gz") as archive:
        seen: set[str] = set()
        members = archive.getmembers()
        if not members:
            raise PublicationError("Publication bundle is empty")
        for member in members:
            name = member.name.removeprefix("./")
            path = PurePosixPath(name)
            if (not name or path.is_absolute() or ".." in path.parts or name in seen
                    or member.issym() or member.islnk() or not (member.isfile() or member.isdir())):
                raise PublicationError(f"Unsafe publication member: {member.name}")
            seen.add(name)
        archive.extractall(destination, filter="data")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def verify_checksums(root: Path) -> None:
    sums = root / "SHA256SUMS"
    if not sums.is_file():
        raise PublicationError("SHA256SUMS is missing")
    expected_files = {"manifest.json", *[str(p.relative_to(root)) for p in (root / "Casks").glob("*.rb")]}
    observed: set[str] = set()
    for line in sums.read_text().splitlines():
        match = re.fullmatch(r"([0-9a-f]{64})  (manifest\.json|Casks/[a-z0-9@-]+\.rb)", line)
        if not match or match.group(2) in observed:
            raise PublicationError("SHA256SUMS contains an invalid or duplicate entry")
        observed.add(match.group(2))
        if sha256(root / match.group(2)) != match.group(1):
            raise PublicationError(f"Checksum mismatch: {match.group(2)}")
    if observed != expected_files:
        raise PublicationError("SHA256SUMS file set does not match the bundle")


def validate_manifest(root: Path, product: str, tag: str, commit: str, registry: dict) -> tuple[dict, list[str]]:
    allowed_top = {"manifest.json", "SHA256SUMS", "Casks"}
    if {p.name for p in root.iterdir()} != allowed_top or not (root / "Casks").is_dir():
        raise PublicationError("Bundle has missing or extra top-level files")
    verify_checksums(root)
    manifest = json.loads((root / "manifest.json").read_text())
    required = {"schema_version", "product", "source_repository", "release_tag", "release_commit",
                "channel", "casks", "artifacts", "applications", "bundle_identifiers",
                "architectures", "minimum_macos", "native_validation"}
    if set(manifest) != required or manifest.get("schema_version") != SCHEMA_VERSION:
        raise PublicationError("Manifest schema is invalid")
    entry = registry["products"].get(product)
    if entry is None or manifest["product"] != product or manifest["source_repository"] != entry["repository"]:
        raise PublicationError("Manifest product or source repository mismatch")
    if manifest["release_tag"] != tag or manifest["release_commit"] != commit or not COMMIT.fullmatch(commit):
        raise PublicationError("Manifest release identity mismatch")
    channel = "beta" if "-beta." in tag else "stable"
    if manifest["channel"] != channel or not re.fullmatch(entry["tag_patterns"][channel], tag):
        raise PublicationError("Tag and channel mismatch")
    expected_casks = [entry["beta_cask"]] if channel == "beta" else [entry["stable_cask"]]
    if channel == "stable" and entry["stable_advances_beta"]:
        expected_casks.append(entry["beta_cask"])
    if manifest["casks"] != expected_casks:
        raise PublicationError("Manifest cask allowlist mismatch")
    actual_casks = sorted(p.name for p in (root / "Casks").iterdir() if p.is_file())
    if sorted(expected_casks) != actual_casks:
        raise PublicationError("Bundle cask file set mismatch")
    channels = ["beta"] if channel == "beta" else (["stable", "beta"] if entry["stable_advances_beta"] else ["stable"])
    if manifest["applications"] != {c: entry["applications"][c] for c in channels}:
        raise PublicationError("Application identity mismatch")
    if manifest["bundle_identifiers"] != {c: entry["bundle_identifiers"][c] for c in channels}:
        raise PublicationError("Bundle identifier mismatch")
    if manifest["architectures"] != entry["architectures"] or manifest["minimum_macos"] != entry["minimum_macos"]:
        raise PublicationError("Platform contract mismatch")
    validation = manifest["native_validation"]
    if set(validation) != {"workflow_run_id", "workflow_run_attempt", "jobs"} or not validation["jobs"]:
        raise PublicationError("Native validation provenance is missing")
    validate_artifacts(manifest["artifacts"], entry, tag, channels)
    version = tag.removeprefix("v")
    for cask in expected_casks:
        text = (root / "Casks" / cask).read_text()
        version_match = re.search(r'^\s*version\s+"([^"]+)"', text, re.MULTILINE)
        if not version_match or version_match.group(1) != version:
            raise PublicationError(f"Cask version does not match the release: {cask}")
        urls = re.findall(r'https://github\.com/[^"#{}]+', text)
        if not urls or any(not url.startswith(f"https://github.com/{entry['repository']}/releases/download/{tag}/") for url in urls):
            raise PublicationError(f"Cask URL escapes the approved release: {cask}")
    return manifest, expected_casks


def validate_artifacts(artifacts: list, entry: dict, tag: str, channels: list[str]) -> None:
    if not isinstance(artifacts, list) or not artifacts:
        raise PublicationError("Artifact manifest is empty")
    names: set[str] = set()
    arches: set[tuple[str, str]] = set()
    for artifact in artifacts:
        if set(artifact) != {"name", "url", "size", "sha256", "channel", "architecture"}:
            raise PublicationError("Artifact schema is invalid")
        name, channel, arch = artifact["name"], artifact["channel"], artifact["architecture"]
        if name in names or channel not in channels or arch not in entry["architectures"]:
            raise PublicationError("Artifact identity is invalid or duplicated")
        names.add(name)
        arches.add((channel, arch))
        if not re.fullmatch(entry["artifact_patterns"][channel], name):
            raise PublicationError(f"Artifact name is not allowed: {name}")
        expected_url = f"https://github.com/{entry['repository']}/releases/download/{tag}/{name}"
        if artifact["url"] != expected_url or not isinstance(artifact["size"], int) or artifact["size"] <= 0 or not HEX64.fullmatch(artifact["sha256"]):
            raise PublicationError(f"Artifact metadata is invalid: {name}")
    if arches != {(channel, arch) for channel in channels for arch in entry["architectures"]}:
        raise PublicationError("Artifact channel/architecture matrix is incomplete")


def gh_json(endpoint: str) -> dict:
    return json.loads(run("gh", "api", endpoint))


def verify_public_state(entry: dict, manifest: dict, run_id: str, run_attempt: str) -> None:
    repository, tag, commit = entry["repository"], manifest["release_tag"], manifest["release_commit"]
    release = gh_json(f"repos/{repository}/releases/tags/{tag}")
    if release.get("draft") or bool(release.get("prerelease")) != (manifest["channel"] == "beta"):
        raise PublicationError("Public release classification mismatch")
    if "immutable" in release and release["immutable"] is not True:
        raise PublicationError("Release is mutable")
    ref = gh_json(f"repos/{repository}/git/ref/tags/{tag}")["object"]
    tag_commit = ref["sha"]
    if ref["type"] == "tag":
        tag_commit = gh_json(f"repos/{repository}/git/tags/{tag_commit}")["object"]["sha"]
    if tag_commit != commit:
        raise PublicationError("Release tag does not resolve to the supplied commit")
    comparison = gh_json(f"repos/{repository}/compare/{commit}...main")
    if comparison["status"] not in {"ahead", "identical"}:
        raise PublicationError("Release commit is not reachable from source main")
    workflow_run = gh_json(f"repos/{repository}/actions/runs/{run_id}")
    if (str(workflow_run["run_attempt"]) != str(run_attempt) or workflow_run["head_sha"] != commit
            or workflow_run["event"] != "push" or workflow_run["path"] != entry["workflow"]
            or workflow_run["head_branch"] != tag or workflow_run["status"] not in {"in_progress", "completed"}
            or workflow_run.get("conclusion") not in {None, "success"}):
        raise PublicationError("Source workflow provenance mismatch")
    assets = {asset["name"]: asset for asset in release["assets"]}
    for artifact in manifest["artifacts"]:
        public = assets.get(artifact["name"])
        if public is None or public["size"] != artifact["size"]:
            raise PublicationError(f"Public artifact metadata mismatch: {artifact['name']}")
        with tempfile.NamedTemporaryFile() as downloaded:
            urllib.request.urlretrieve(artifact["url"], downloaded.name)
            if sha256(Path(downloaded.name)) != artifact["sha256"]:
                raise PublicationError(f"Public artifact digest mismatch: {artifact['name']}")


def current_cask_version(path: Path) -> str:
    match = re.search(r'^\s*version\s+"([^"]+)"', path.read_text(), re.MULTILINE)
    if not match:
        raise PublicationError(f"Cannot read current cask version: {path.name}")
    return match.group(1)


def apply_casks(root: Path, casks: list[str], casks_dir: Path) -> list[str]:
    changed: list[str] = []
    for name in casks:
        source, target = root / "Casks" / name, casks_dir / name
        if target.exists() and parse_version(current_cask_version(source)) < parse_version(current_cask_version(target)):
            raise PublicationError(f"Refusing to downgrade {name}")
        if not target.exists() or source.read_bytes() != target.read_bytes():
            shutil.copyfile(source, target)
            changed.append(name)
    return changed


def download_bundle(repository: str, tag: str, destination: Path) -> None:
    run("gh", "release", "download", tag, "--repo", repository, "--pattern", BUNDLE_NAME,
        "--dir", str(destination), "--clobber")


def verify_attestation(bundle: Path, repository: str) -> None:
    run("gh", "attestation", "verify", str(bundle), "--repo", repository)


def command_validate(args: argparse.Namespace) -> dict:
    registry = load_registry(Path(args.registry))
    entry = registry["products"].get(args.product)
    if entry is None or not COMMIT.fullmatch(args.commit) or not CORRELATION.fullmatch(args.correlation):
        raise PublicationError("Dispatch inputs are invalid")
    with tempfile.TemporaryDirectory() as temporary:
        temporary_path = Path(temporary)
        bundle = Path(args.bundle) if args.bundle else temporary_path / BUNDLE_NAME
        if not args.bundle:
            download_bundle(entry["repository"], args.tag, temporary_path)
        if not args.skip_attestation:
            verify_attestation(bundle, entry["repository"])
        extracted = temporary_path / "extracted"
        extracted.mkdir()
        safe_extract(bundle, extracted)
        manifest, casks = validate_manifest(extracted, args.product, args.tag, args.commit, registry)
        if not args.offline:
            verify_public_state(entry, manifest, args.run_id, args.run_attempt)
        changed = apply_casks(extracted, casks, Path(args.casks_dir)) if args.apply else []
        return {"product": args.product, "tag": args.tag, "release_commit": args.commit,
                "correlation": args.correlation, "casks": casks, "changed_casks": changed}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--product", required=True)
    parser.add_argument("--tag", required=True)
    parser.add_argument("--commit", required=True)
    parser.add_argument("--run-id", required=True)
    parser.add_argument("--run-attempt", required=True)
    parser.add_argument("--correlation", required=True)
    parser.add_argument("--registry", default=str(REGISTRY_PATH))
    parser.add_argument("--bundle")
    parser.add_argument("--casks-dir", default=str(ROOT / "Casks"))
    parser.add_argument("--apply", action="store_true")
    parser.add_argument("--offline", action="store_true")
    parser.add_argument("--skip-attestation", action="store_true")
    args = parser.parse_args()
    summary = command_validate(args)
    output = json.dumps(summary, sort_keys=True)
    print(output)
    if os.environ.get("GITHUB_OUTPUT"):
        with open(os.environ["GITHUB_OUTPUT"], "a", encoding="utf-8") as stream:
            stream.write(f"summary={output}\nchanged={'true' if summary['changed_casks'] else 'false'}\n")


if __name__ == "__main__":
    try:
        main()
    except (PublicationError, subprocess.CalledProcessError, json.JSONDecodeError, tarfile.TarError) as error:
        raise SystemExit(f"Homebrew publication rejected: {error}") from error

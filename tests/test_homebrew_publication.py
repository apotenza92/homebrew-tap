import hashlib
import io
import json
import os
import sys
import tarfile
import tempfile
import unittest
import urllib.error
from contextlib import redirect_stdout
from pathlib import Path
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))
import homebrew_publication as publication
import resolve_reconciliation as reconciliation


class PublicationContractTests(unittest.TestCase):
    def setUp(self):
        self.registry = publication.load_registry()

    def test_registry_owns_exactly_twelve_distinct_casks(self):
        products = self.registry["products"]
        self.assertEqual(6, len(products))
        casks = [entry[key] for entry in products.values() for key in ("stable_cask", "beta_cask")]
        self.assertEqual(12, len(set(casks)))
        self.assertEqual(["arm64"], products["caul"]["architectures"])

    def test_registry_rejects_duplicate_cask_ownership(self):
        data = json.loads((ROOT / "homebrew-products.json").read_text())
        data["products"]["caul"]["stable_cask"] = "butter-paper.rb"
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "registry.json"
            path.write_text(json.dumps(data))
            with self.assertRaisesRegex(publication.PublicationError, "ownership"):
                publication.load_registry(path)

    def test_semver_orders_prerelease_before_final_and_rejects_downgrade(self):
        self.assertLess(publication.parse_version("1.2.3-beta.9"), publication.parse_version("1.2.3"))
        self.assertGreater(publication.parse_version("1.2.4-beta.1"), publication.parse_version("1.2.3"))
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            source = root / "source"
            casks = root / "current"
            (source / "Casks").mkdir(parents=True)
            casks.mkdir()
            (source / "Casks" / "caul.rb").write_text('cask "caul" do\n  version "1.0.0"\nend\n')
            (casks / "caul.rb").write_text('cask "caul" do\n  version "1.0.1"\nend\n')
            with self.assertRaisesRegex(publication.PublicationError, "downgrade"):
                publication.apply_casks(source, ["caul.rb"], casks)

    def test_safe_extract_rejects_traversal_symlink_and_duplicate(self):
        for kind in ("traversal", "symlink", "duplicate"):
            with self.subTest(kind=kind), tempfile.TemporaryDirectory() as directory:
                bundle = Path(directory) / "bundle.tar.gz"
                with tarfile.open(bundle, "w:gz") as archive:
                    if kind == "traversal":
                        info = tarfile.TarInfo("../escape")
                        info.size = 1
                        archive.addfile(info, io.BytesIO(b"x"))
                    elif kind == "symlink":
                        info = tarfile.TarInfo("Casks/link.rb")
                        info.type = tarfile.SYMTYPE
                        info.linkname = "../../escape"
                        archive.addfile(info)
                    else:
                        for _ in range(2):
                            info = tarfile.TarInfo("manifest.json")
                            info.size = 2
                            archive.addfile(info, io.BytesIO(b"{}"))
                with self.assertRaisesRegex(publication.PublicationError, "Unsafe"):
                    publication.safe_extract(bundle, Path(directory) / "out")

    def build_bundle(self, mutate=None):
        temporary = tempfile.TemporaryDirectory()
        root = Path(temporary.name)
        (root / "Casks").mkdir()
        entry = self.registry["products"]["butter-paper"]
        tag = "v1.2.3"
        for channel, filename in (("stable", entry["stable_cask"]), ("beta", entry["beta_cask"])):
            prefix = "Butter-Paper" if channel == "stable" else "Butter-Paper-Beta"
            livecheck = (
                f'  livecheck do\n    url "https://github.com/{entry["repository"]}/releases"\n'
                '    strategy :page_match\n  end\n'
                if channel == "beta" else ""
            )
            (root / "Casks" / filename).write_text(
                f'cask "x" do\n  version "1.2.3"\n  url "https://github.com/{entry["repository"]}/releases/download/v#{{version}}/{prefix}-macOS-arm64.zip"\n{livecheck}end\n'
            )
        manifest = {
            "schema_version": 1,
            "product": "butter-paper",
            "source_repository": entry["repository"],
            "release_tag": tag,
            "release_commit": "a" * 40,
            "channel": "stable",
            "casks": [entry["stable_cask"], entry["beta_cask"]],
            "artifacts": [],
            "applications": entry["applications"],
            "bundle_identifiers": entry["bundle_identifiers"],
            "architectures": entry["architectures"],
            "minimum_macos": entry["minimum_macos"],
            "native_validation": {"workflow_run_id": 12, "workflow_run_attempt": 1, "jobs": ["arm64", "x64"]},
        }
        for channel in ("stable", "beta"):
            prefix = "Butter-Paper" if channel == "stable" else "Butter-Paper-Beta"
            for arch in entry["architectures"]:
                name = f"{prefix}-macOS-{arch}.zip"
                manifest["artifacts"].append({"name": name, "url": f"https://github.com/{entry['repository']}/releases/download/{tag}/{name}", "size": 1, "sha256": "b" * 64, "channel": channel, "architecture": arch})
        if mutate:
            mutate(root, manifest)
        (root / "manifest.json").write_text(json.dumps(manifest, sort_keys=True))
        checksum_paths = [root / "manifest.json", *sorted((root / "Casks").glob("*.rb"))]
        (root / "SHA256SUMS").write_text("".join(
            f"{hashlib.sha256(path.read_bytes()).hexdigest()}  {path.relative_to(root)}\n" for path in checksum_paths
        ))
        return temporary, root

    def test_manifest_accepts_exact_stable_bundle(self):
        temporary, root = self.build_bundle()
        self.addCleanup(temporary.cleanup)
        manifest, casks = publication.validate_manifest(root, "butter-paper", "v1.2.3", "a" * 40, self.registry)
        self.assertEqual("stable", manifest["channel"])
        self.assertEqual(["butter-paper.rb", "butter-paper@beta.rb"], casks)

    def test_manifest_rejects_source_mismatch_extra_cask_and_bad_url(self):
        cases = {
            "source": lambda root, manifest: manifest.update(source_repository="evil/source"),
            "extra": lambda root, manifest: (root / "Casks" / "extra.rb").write_text("bad"),
            "url": lambda root, manifest: manifest["artifacts"][0].update(url="https://example.com/evil.zip"),
        }
        for name, mutation in cases.items():
            with self.subTest(name=name):
                temporary, root = self.build_bundle(mutation)
                self.addCleanup(temporary.cleanup)
                with self.assertRaises(publication.PublicationError):
                    publication.validate_manifest(root, "butter-paper", "v1.2.3", "a" * 40, self.registry)

    def test_checksum_rejects_missing_extra_and_modified_files(self):
        for name, mutation in {
            "missing": lambda root: (root / "SHA256SUMS").write_text(""),
            "extra": lambda root: (root / "extra").write_text("x"),
            "modified": lambda root: (root / "manifest.json").write_text("{}"),
        }.items():
            with self.subTest(name=name):
                temporary, root = self.build_bundle()
                self.addCleanup(temporary.cleanup)
                mutation(root)
                with self.assertRaises(publication.PublicationError):
                    publication.validate_manifest(root, "butter-paper", "v1.2.3", "a" * 40, self.registry)

    def test_apply_is_idempotent_and_changes_only_allowlisted_casks(self):
        temporary, root = self.build_bundle()
        self.addCleanup(temporary.cleanup)
        current = root / "current"
        current.mkdir()
        for path in (root / "Casks").glob("*.rb"):
            (current / path.name).write_bytes(path.read_bytes())
        (current / "unrelated.rb").write_text("untouched")
        self.assertEqual([], publication.apply_casks(root, ["butter-paper.rb", "butter-paper@beta.rb"], current))
        self.assertEqual("untouched", (current / "unrelated.rb").read_text())

    def test_failed_source_run_is_recoverable_only_after_public_verification(self):
        repository = "apotenza92/fraia"
        run = {"id": 42, "status": "completed", "conclusion": "failure"}

        def check(jobs):
            with patch.object(
                publication,
                "gh_json",
                return_value={"jobs": jobs},
            ):
                return publication.source_run_is_publishable(repository, run)

        self.assertTrue(check([
            {"name": "Verify public release and feeds", "conclusion": "success"},
            {"name": "Homebrew stable (arm64)", "conclusion": "failure"},
        ]))
        self.assertFalse(check([
            {"name": "Verify public release and feeds", "conclusion": "failure"},
            {"name": "Homebrew stable (arm64)", "conclusion": "failure"},
        ]))
        self.assertFalse(check([
            {"name": "Verify public release and feeds", "conclusion": "success"},
            {"name": "Publish stable release and eligible feeds", "conclusion": "failure"},
        ]))
        self.assertFalse(check([
            {"name": "Verify public release and feeds", "conclusion": "success"},
            {"name": "Homebrew stable (arm64)", "conclusion": "cancelled"},
        ]))

    def test_public_artifact_download_retries_transient_tls_errors(self):
        with tempfile.TemporaryDirectory() as directory:
            destination = Path(directory) / "artifact.dmg"
            with (
                patch.object(
                    publication.urllib.request,
                    "urlretrieve",
                    side_effect=[urllib.error.URLError("temporary TLS failure"), None],
                ) as retrieve,
                patch.object(publication.time, "sleep") as sleep,
            ):
                publication.download_public_artifact(
                    "https://example.test/artifact.dmg",
                    destination,
                )
        self.assertEqual(2, retrieve.call_count)
        sleep.assert_called_once_with(5)

    def test_public_artifact_download_keeps_tls_verification_fail_closed(self):
        with tempfile.TemporaryDirectory() as directory:
            destination = Path(directory) / "artifact.dmg"
            with (
                patch.object(
                    publication.urllib.request,
                    "urlretrieve",
                    side_effect=urllib.error.URLError("persistent TLS failure"),
                ) as retrieve,
                patch.object(publication.time, "sleep") as sleep,
            ):
                with self.assertRaisesRegex(
                    publication.PublicationError,
                    "failed after 4 attempts",
                ):
                    publication.download_public_artifact(
                        "https://example.test/artifact.dmg",
                        destination,
                    )
        self.assertEqual(4, retrieve.call_count)
        self.assertEqual(3, sleep.call_count)

    def test_dispatch_workflow_serialises_each_product_and_uses_scoped_repository_token(self):
        workflow = (ROOT / ".github/workflows/publish-homebrew.yml").read_text()
        self.assertIn("group: homebrew-tap-publication-${{ inputs.product || github.event.client_payload.product }}", workflow)
        self.assertNotIn("environment: tap-publication", workflow)
        self.assertNotIn("HOMEBREW_PUBLISHER_PRIVATE_KEY", workflow)
        self.assertNotIn("actions/create-github-app-token", workflow)
        self.assertIn("permissions:\n  contents: write", workflow)
        self.assertIn("token: ${{ github.token }}", workflow)
        self.assertNotIn("pull_request:", workflow)

    def test_daily_reconciliation_covers_all_products_and_is_fail_open_per_item(self):
        workflow = (ROOT / ".github/workflows/reconcile-homebrew.yml").read_text()
        self.assertIn('cron: "19 3 * * *"', workflow)
        self.assertIn("fail-fast: false", workflow)
        self.assertIn("max-parallel: 1", workflow)
        for product in self.registry["products"]:
            self.assertIn(product, workflow)

    def test_reconciliation_treats_failed_source_release_as_healthy_noop(self):
        commit = "a" * 40

        def fake_gh(endpoint):
            if endpoint.endswith("/releases?per_page=100"):
                return [{
                    "draft": False,
                    "prerelease": False,
                    "tag_name": "v1.4.2",
                    "assets": [{"name": publication.BUNDLE_NAME}],
                }]
            if "/git/ref/tags/" in endpoint:
                return {"object": {"type": "commit", "sha": commit}}
            if "/actions/workflows/" in endpoint:
                return {"workflow_runs": []}
            self.fail(f"Unexpected endpoint: {endpoint}")

        output = io.StringIO()
        with patch.object(reconciliation, "gh", side_effect=fake_gh), \
             patch.object(sys, "argv", ["resolve_reconciliation.py", "--product",
                                        "facebook-messenger-desktop", "--channel", "stable"]), \
             patch.dict(os.environ, {}, clear=True), redirect_stdout(output):
            reconciliation.main()

        self.assertEqual({
            "eligible": False,
            "product": "facebook-messenger-desktop",
            "channel": "stable",
            "tag": "v1.4.2",
            "reason": "no-successful-source-run",
        }, json.loads(output.getvalue()))

    def test_legacy_direct_cask_writers_are_retired(self):
        for path in (
            ROOT / ".github/workflows/update-fraia-casks.yml",
            ROOT / ".github/workflows/update-messenger-casks.yml",
            ROOT / "scripts/update-fraia-casks.sh",
            ROOT / "scripts/update-messenger-casks.sh",
        ):
            self.assertFalse(path.exists(), path)


if __name__ == "__main__":
    unittest.main()

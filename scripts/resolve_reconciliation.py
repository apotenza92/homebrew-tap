#!/usr/bin/env python3
"""Resolve the newest eligible bundle-backed public release for one channel."""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import urllib.parse
from pathlib import Path

from homebrew_publication import BUNDLE_NAME, PublicationError, load_registry, parse_version


def gh(endpoint: str) -> object:
    result = subprocess.run(["gh", "api", "--paginate", endpoint], check=True, text=True, stdout=subprocess.PIPE)
    return json.loads(result.stdout)


def emit(result: dict[str, object]) -> None:
    print(json.dumps(result, sort_keys=True))
    if os.environ.get("GITHUB_OUTPUT"):
        with Path(os.environ["GITHUB_OUTPUT"]).open("a") as output:
            for key, value in result.items():
                output.write(f"{key}={str(value).lower() if isinstance(value, bool) else value}\n")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--product", required=True)
    parser.add_argument("--channel", required=True, choices=("stable", "beta"))
    args = parser.parse_args()
    entry = load_registry()["products"].get(args.product)
    if entry is None:
        raise PublicationError("Unknown product")
    releases = gh(f"repos/{entry['repository']}/releases?per_page=100")
    candidates = [release for release in releases if not release["draft"]
                  and bool(release["prerelease"]) == (args.channel == "beta")
                  and any(asset["name"] == BUNDLE_NAME for asset in release["assets"])]
    if not candidates:
        emit({"eligible": False, "product": args.product, "channel": args.channel,
              "reason": "no-bundle-backed-release"})
        return
    release = max(candidates, key=lambda item: parse_version(item["tag_name"]))
    tag = release["tag_name"]
    ref = gh(f"repos/{entry['repository']}/git/ref/tags/{urllib.parse.quote(tag, safe='')}")["object"]
    commit = ref["sha"]
    if ref["type"] == "tag":
        commit = gh(f"repos/{entry['repository']}/git/tags/{commit}")["object"]["sha"]
    workflow = urllib.parse.quote(entry["workflow"], safe="")
    runs = gh(f"repos/{entry['repository']}/actions/workflows/{workflow}/runs?event=push&head_sha={commit}&per_page=100")["workflow_runs"]
    runs = [run for run in runs if run["head_branch"] == tag and run["conclusion"] == "success"]
    if not runs:
        emit({"eligible": False, "product": args.product, "channel": args.channel,
              "tag": tag, "reason": "no-successful-source-run"})
        return
    run = max(runs, key=lambda item: (item["run_number"], item["run_attempt"]))
    result = {"eligible": True, "product": args.product, "channel": args.channel, "tag": tag,
              "release_commit": commit, "source_run_id": str(run["id"]),
              "source_run_attempt": str(run["run_attempt"]),
              "correlation_id": f"reconcile:{args.product}:{args.channel}:{run['id']}:{run['run_attempt']}"}
    emit(result)


if __name__ == "__main__":
    main()

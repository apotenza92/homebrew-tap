#!/usr/bin/env python3
"""Prove a legacy current cask is an immutable exact-byte no-op."""
from __future__ import annotations
import argparse, hashlib, json, re, subprocess, tempfile, urllib.request
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
def gh(endpoint): return json.loads(subprocess.check_output(["gh","api",endpoint],text=True))
def digest(path): return hashlib.sha256(path.read_bytes()).hexdigest()
def main():
    p=argparse.ArgumentParser();p.add_argument("--product",required=True);p.add_argument("--channel",choices=("stable","beta"),required=True);a=p.parse_args()
    registry=json.loads((ROOT/"homebrew-products.json").read_text())["products"]
    if a.product not in registry: raise SystemExit("unknown product")
    entry=registry[a.product]; name=entry[f"{a.channel}_cask"]; cask=ROOT/"Casks"/name; before=digest(cask); text=cask.read_text()
    version=re.search(r'^\s*version\s+"([^"]+)"',text,re.M)
    if not version: raise SystemExit("missing cask version")
    tag=f"v{version.group(1)}"; release=gh(f"repos/{entry['repository']}/releases/tags/{tag}")
    if release.get("draft"): raise SystemExit("release is not public")
    immutable_supported = release.get("immutable") is True
    expected_beta="-beta." in tag
    if bool(release.get("prerelease")) != expected_beta: raise SystemExit("release classification mismatch")
    assets={x["name"]:x for x in release["assets"]}; urls=re.findall(r'^\s*url\s+"(https://github\.com/[^"]+/releases/download/[^"]+)"',text,re.M); shas=re.findall(r'^\s*sha256\s+"([0-9a-f]{64})"',text,re.M)
    if len(urls)!=len(entry["architectures"]) or len(shas)!=len(urls): raise SystemExit("cask architecture mismatch")
    with tempfile.TemporaryDirectory() as tmp:
      for url,want in zip(urls,shas):
        resolved=url.replace("v#{version}",tag); asset_name=resolved.rsplit("/",1)[-1]; asset=assets.get(asset_name)
        if not asset or asset.get("digest") != f"sha256:{want}": raise SystemExit(f"release metadata mismatch: {asset_name}")
        target=Path(tmp)/asset_name; urllib.request.urlretrieve(resolved,target)
        if digest(target)!=want or target.stat().st_size!=asset["size"]: raise SystemExit(f"public bytes mismatch: {asset_name}")
    ref=gh(f"repos/{entry['repository']}/git/ref/tags/{tag}")["object"]
    commit=ref["sha"] if ref["type"]=="commit" else gh(f"repos/{entry['repository']}/git/tags/{ref['sha']}")["object"]["sha"]
    comparison=gh(f"repos/{entry['repository']}/compare/{commit}...main")
    if comparison["status"] not in ("ahead","identical"): raise SystemExit("tag commit is not reachable from main")
    if digest(cask)!=before: raise SystemExit("verification mutated the cask")
    if (ROOT/".git").exists() and subprocess.run(["git","diff","--quiet","--",str(cask)],cwd=ROOT).returncode: raise SystemExit("verification mutated the checkout")
    print(json.dumps({"product":a.product,"channel":a.channel,"tag":tag,"cask":name,"commit":commit,"release_immutable":immutable_supported,"no_op":True},sort_keys=True))
if __name__=="__main__": main()

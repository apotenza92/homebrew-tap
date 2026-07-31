#!/usr/bin/env bash

set -euo pipefail

source_repository="apotenza92/facebook-messenger-desktop"
repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
work_directory="$(mktemp -d)"
trap 'rm -rf "$work_directory"' EXIT

releases_file="$work_directory/releases.json"
gh api "repos/${source_repository}/releases?per_page=100" >"$releases_file"

verify_and_update() {
  local channel="$1"
  local cask_path="$2"
  local tag_filter="$3"
  local arm_asset="$4"
  local intel_asset="$5"
  local app_name="$6"
  local expected_architecture
  local current_version
  local release
  local tag
  local version
  local arm_sha
  local intel_sha

  release="$(
    jq -cer --arg filter "$tag_filter" \
      '[.[] | select(.draft == false and (.tag_name | test($filter)))] | first' \
      "$releases_file"
  )"
  tag="$(jq -er '.tag_name' <<<"$release")"
  version="${tag#v}"
  current_version="$(
    ruby -e '
      text = File.read(ARGV.fetch(0))
      match = text.match(/^\s*version "([^"]+)"/)
      abort "Unable to read cask version" unless match
      puts match[1]
    ' "$cask_path"
  )"

  if [[ "$current_version" == "$version" ]]; then
    echo "${channel} cask is current at ${version}"
    return
  fi

  echo "Verifying ${channel} ${version} before updating the cask"

  for expected_architecture in arm64 x86_64; do
    local asset_name
    local asset
    local download_url
    local published_digest
    local archive
    local extract_directory
    local app_path
    local executable_name
    local executable_path
    local actual_architectures
    local actual_digest
    local signature_details
    local bundle_version

    if [[ "$expected_architecture" == "arm64" ]]; then
      asset_name="$arm_asset"
    else
      asset_name="$intel_asset"
    fi

    asset="$(jq -cer --arg name "$asset_name" '.assets[] | select(.name == $name)' <<<"$release")"
    download_url="$(jq -er '.browser_download_url' <<<"$asset")"
    published_digest="$(jq -er '.digest | select(startswith("sha256:"))' <<<"$asset")"
    published_digest="${published_digest#sha256:}"

    archive="$work_directory/$asset_name"
    extract_directory="$work_directory/${channel}-${expected_architecture}"
    mkdir -p "$extract_directory"
    curl --fail --location --retry 4 --retry-all-errors \
      --output "$archive" "$download_url"

    actual_digest="$(shasum -a 256 "$archive" | awk '{print $1}')"
    if [[ "$actual_digest" != "$published_digest" ]]; then
      echo "Digest mismatch for ${asset_name}" >&2
      exit 1
    fi

    ditto -x -k "$archive" "$extract_directory"
    app_path="$extract_directory/$app_name"
    if [[ ! -d "$app_path" ]]; then
      echo "Expected app is missing from ${asset_name}: ${app_name}" >&2
      exit 1
    fi

    bundle_version="$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$app_path/Contents/Info.plist")"
    if [[ "$bundle_version" != "$version" ]]; then
      echo "Bundle version ${bundle_version} does not match release ${version}" >&2
      exit 1
    fi

    executable_name="$(/usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "$app_path/Contents/Info.plist")"
    executable_path="$app_path/Contents/MacOS/$executable_name"
    actual_architectures="$(lipo -archs "$executable_path")"
    if [[ " $actual_architectures " != *" $expected_architecture "* ]]; then
      echo "${asset_name} does not contain ${expected_architecture}" >&2
      exit 1
    fi

    codesign --verify --deep --strict --verbose=2 "$app_path"
    signature_details="$(codesign --display --verbose=4 "$app_path" 2>&1)"
    grep -q '^Authority=Developer ID Application:' <<<"$signature_details"
    grep -q '^Timestamp=' <<<"$signature_details"
    grep -q 'flags=.*runtime' <<<"$signature_details"
    spctl --assess --type execute --verbose=4 "$app_path"
    xcrun stapler validate "$app_path"

    if [[ "$expected_architecture" == "arm64" ]]; then
      arm_sha="$actual_digest"
    else
      intel_sha="$actual_digest"
    fi
  done

  CASK_PATH="$cask_path" \
    CASK_VERSION="$version" \
    CASK_ARM_SHA="$arm_sha" \
    CASK_INTEL_SHA="$intel_sha" \
    ruby <<'RUBY'
path = ENV.fetch("CASK_PATH")
text = File.read(path)

replacements = {
  /^\s{2}version "[^"]+"$/ => %(  version "#{ENV.fetch("CASK_VERSION")}"),
  /(?<=  on_arm do\n    sha256 ")[0-9a-f]{64}(?=")/ => ENV.fetch("CASK_ARM_SHA"),
  /(?<=  on_intel do\n    sha256 ")[0-9a-f]{64}(?=")/ => ENV.fetch("CASK_INTEL_SHA"),
}

replacements.each do |pattern, replacement|
  matches = text.scan(pattern).length
  abort "Expected one match for #{pattern.inspect}, found #{matches}" unless matches == 1
  text.sub!(pattern, replacement)
end

File.write(path, text)
RUBY

  echo "Updated ${channel} cask from ${current_version} to ${version}"
}

verify_and_update \
  "stable" \
  "$repository_root/Casks/facebook-messenger-desktop.rb" \
  '^v[0-9]+\.[0-9]+\.[0-9]+$' \
  "Messenger-macos-arm64.zip" \
  "Messenger-macos-x64.zip" \
  "Messenger.app"

verify_and_update \
  "beta" \
  "$repository_root/Casks/facebook-messenger-desktop@beta.rb" \
  '^v[0-9]+\.[0-9]+\.[0-9]+-beta\.[1-9][0-9]*$' \
  "Messenger-Beta-macos-arm64.zip" \
  "Messenger-Beta-macos-x64.zip" \
  "Messenger Beta.app"

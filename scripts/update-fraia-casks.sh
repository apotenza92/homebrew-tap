#!/usr/bin/env bash

set -euo pipefail

source_repository="apotenza92/fraia"
repository_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
work_directory="$(mktemp -d)"
trap 'rm -rf "$work_directory"' EXIT

releases_file="$work_directory/releases.json"
gh api "repos/${source_repository}/releases?per_page=100" >"$releases_file"

select_release() {
  local channel="$1"
  local arm_asset="$2"
  local intel_asset="$3"

  RELEASE_CHANNEL="$channel" \
    RELEASES_FILE="$releases_file" \
    ARM_ASSET="$arm_asset" \
    INTEL_ASSET="$intel_asset" \
    ruby <<'RUBY'
require "json"
require "rubygems/version"

channel = ENV.fetch("RELEASE_CHANNEL")
required_assets = [ENV.fetch("ARM_ASSET"), ENV.fetch("INTEL_ASSET")]
releases = JSON.parse(File.read(ENV.fetch("RELEASES_FILE")))
stable_tag = /^v\d+\.\d+\.\d+$/
beta_tag = /^v\d+\.\d+\.\d+-beta\.\d+$/

candidates = releases.select do |release|
  next false if release.fetch("draft")

  tag = release.fetch("tag_name")
  allowed_tag = if channel == "stable"
                  !release.fetch("prerelease") && stable_tag.match?(tag)
                else
                  stable_tag.match?(tag) || beta_tag.match?(tag)
                end
  next false unless allowed_tag

  asset_names = release.fetch("assets").map { |asset| asset.fetch("name") }
  required_assets.all? { |asset| asset_names.include?(asset) }
end

abort "No verified #{channel} Fraia release has the required macOS assets" if candidates.empty?

selected = candidates.max_by do |release|
  Gem::Version.new(release.fetch("tag_name").delete_prefix("v"))
end
puts JSON.generate(selected)
RUBY
}

verify_and_update() {
  local channel="$1"
  local cask_path="$2"
  local arm_asset="$3"
  local intel_asset="$4"
  local app_name="$5"
  local expected_bundle_id="$6"
  local expected_architecture
  local current_version
  local release
  local tag
  local version
  local arm_sha
  local intel_sha

  release="$(select_release "$channel" "$arm_asset" "$intel_asset")"
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

  CURRENT_VERSION="$current_version" TARGET_VERSION="$version" ruby <<'RUBY'
require "rubygems/version"

current = Gem::Version.new(ENV.fetch("CURRENT_VERSION"))
target = Gem::Version.new(ENV.fetch("TARGET_VERSION"))
abort "Refusing to downgrade Fraia cask from #{current} to #{target}" if target < current
RUBY

  if [[ "$current_version" == "$version" && "${FRAIA_FORCE_VERIFY:-0}" != "1" ]]; then
    echo "${channel} cask is current at ${version}"
    return
  fi

  echo "Verifying Fraia ${channel} ${version} before updating the cask"

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
    local bundle_id
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

    bundle_id="$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "$app_path/Contents/Info.plist")"
    if [[ "$bundle_id" != "$expected_bundle_id" ]]; then
      echo "Bundle identifier ${bundle_id} does not match ${expected_bundle_id}" >&2
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
  "$repository_root/Casks/fraia.rb" \
  "Fraia-macOS-arm64.zip" \
  "Fraia-macOS-x64.zip" \
  "Fraia.app" \
  "app.fraia.desktop"

verify_and_update \
  "beta" \
  "$repository_root/Casks/fraia@beta.rb" \
  "Fraia-Beta-macOS-arm64.zip" \
  "Fraia-Beta-macOS-x64.zip" \
  "Fraia Beta.app" \
  "app.fraia.desktop.beta"

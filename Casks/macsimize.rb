cask "macsimize" do
  version "0.2.6"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.6/Macsimize-v0.2.6-macos-arm64.zip"
    sha256 "00974f5495795d082423034a40b8aaf64d4677a68eb9c562e7213de68db317f5"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.6/Macsimize-v0.2.6-macos-x64.zip"
    sha256 "902b9e6fff0bfb7fecca00b70659f5a05361692cdc2e940f34992f4afe61c3e4"
  end

  name "Macsimize"
  desc "Green-button maximize and full-screen remapper for macOS"
  homepage "https://github.com/apotenza92/macsimize"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Macsimize.app"

  zap trash: [
    "~/Library/Application Support/Macsimize",
    "~/Library/Caches/pzc.Macsimize",
    "~/Library/Preferences/pzc.Macsimize.plist",
    "~/Library/Saved Application State/pzc.Macsimize.savedState",
  ]
end

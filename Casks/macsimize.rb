cask "macsimize" do
  version "0.3.4"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.4/Macsimize-v0.3.4-macos-arm64.zip"
    sha256 "3a5a16b8e91a0aa864a93ff7e71385980d9d99b5bbcc1c99155fcb8cd7e9a1e0"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.4/Macsimize-v0.3.4-macos-x64.zip"
    sha256 "0358bb3638b39dacb06a7ca3df33df484cf6979c4aec1d4f0acdb2af74dbe757"
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

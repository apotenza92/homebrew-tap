cask "macsimize" do
  version "0.2.8"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.8/Macsimize-v0.2.8-macos-arm64.zip"
    sha256 "42103f4296e265743d2ae8abe8bcd6310a1424f178229a1e16057ec6714c8258"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.8/Macsimize-v0.2.8-macos-x64.zip"
    sha256 "6ac56a5d3ec3533d29edd8c45bcb4e20e643301d4924039640577b44a9aceccc"
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

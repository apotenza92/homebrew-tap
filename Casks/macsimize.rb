cask "macsimize" do
  version "0.2.13"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.13/Macsimize-v0.2.13-macos-arm64.zip"
    sha256 "1f52f6b3b03905b9503ec9c18278225d6b9527e025e380c7ee5e17dabbb821f5"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.13/Macsimize-v0.2.13-macos-x64.zip"
    sha256 "af5102a2aebc377efa91b47992e27ae61ee531ede55039b834ef48763a7c52e4"
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

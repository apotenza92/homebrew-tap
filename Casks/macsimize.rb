cask "macsimize" do
  version "0.3.5"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.5/Macsimize-v0.3.5-macos-arm64.zip"
    sha256 "8f0d93b067266699cf8e36618552ac6347299ad3fa42223e740171bebac908d5"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.5/Macsimize-v0.3.5-macos-x64.zip"
    sha256 "7bf6efb5f3b3646f0a4768f966028939f4da6124844f4385ea6a640908678c73"
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

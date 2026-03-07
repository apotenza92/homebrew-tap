cask "macsimize" do
  version "0.2.4"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.4/Macsimize-v0.2.4-macos-arm64.zip"
    sha256 "9a75b1d91f090eb10cb18b3a092b3f442b7d04df53e2e28a777baf45b5f42470"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.4/Macsimize-v0.2.4-macos-x64.zip"
    sha256 "7ab88e8041a356ab73c410fa416085a1f515e84adfe58bf0a9642aea87f1feb8"
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

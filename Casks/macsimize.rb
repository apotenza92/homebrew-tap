cask "macsimize" do
  version "0.2.1"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.1/Macsimize-v0.2.1-macos-arm64.zip"
    sha256 "2a498d52599e81d7f91d9a2cdc3ca9d9fd64d179dd664c46a68dd0a40bb70603"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.1/Macsimize-v0.2.1-macos-x64.zip"
    sha256 "58715fc487c7b933a4db22b5a51147951fbb979be1047bd73abec8a50cdee3e6"
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

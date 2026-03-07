cask "macsimize" do
  version "0.2.2"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.2/Macsimize-v0.2.2-macos-arm64.zip"
    sha256 "f7a8c9066146d5e4620b1963363ed829043094057a64ad04dea7274da48e6e98"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.2/Macsimize-v0.2.2-macos-x64.zip"
    sha256 "5d5ff98dc470676d9c31ac84cff028e5c4245f8399f8023a4ad7b0ffa33ac2ce"
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

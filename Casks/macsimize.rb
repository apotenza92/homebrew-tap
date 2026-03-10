cask "macsimize" do
  version "0.3.1"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.1/Macsimize-v0.3.1-macos-arm64.zip"
    sha256 "349217dfc5207a496cbb35f6fd7b8dd3a965b392c8e4af7ea01b156d5cececeb"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.1/Macsimize-v0.3.1-macos-x64.zip"
    sha256 "63e14f1f928e54292c16f9815333d0b996ae451beea839fadc6569d3ae088835"
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

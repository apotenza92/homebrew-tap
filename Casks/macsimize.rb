cask "macsimize" do
  version "0.2.9"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.9/Macsimize-v0.2.9-macos-arm64.zip"
    sha256 "f3b3361d9e7b130c2977a410261f060e4251dfe3eb0f3ab4fb1ae0350a55502c"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.9/Macsimize-v0.2.9-macos-x64.zip"
    sha256 "3b21d01072d647416f9568ef292f923b35505d19908b1c431bad8f60036e6c4c"
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

cask "macsimize" do
  version "0.2.15"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.15/Macsimize-v0.2.15-macos-arm64.zip"
    sha256 "08a0c31015adb724ca3e8be3d39e18eb39d4377b856555e61d2aeceb66001451"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.15/Macsimize-v0.2.15-macos-x64.zip"
    sha256 "2ff2136bcd301f69df6248dee56b000cfe3a56251b26238b482f4a68e1a8197a"
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

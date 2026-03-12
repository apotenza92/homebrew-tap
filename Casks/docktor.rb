cask "docktor" do
  version "0.2.0"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.2.0/Docktor-v0.2.0-macos-arm64.zip"
    sha256 "576f294ef228b119a53007cb36dd2150fe72fb27f767b967615e92b44de7eae8"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.2.0/Docktor-v0.2.0-macos-x64.zip"
    sha256 "4be57963a401c0b08bdbada019ea205a094f4064e8461429cb7df1a8b074aa98"
  end

  name "Docktor"
  desc "Dock gesture actions for macOS"
  homepage "https://github.com/apotenza92/docktor"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Docktor.app"

  zap trash: [
    "~/Library/Application Support/Docktor",
    "~/Library/Caches/pzc.Dockter",
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
  ]
end

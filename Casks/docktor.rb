cask "docktor" do
  version "0.0.28"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.28/Docktor-v0.0.28-macos-arm64.zip"
    sha256 "887df9791d6585260cce789c1f72271c2808f9c03ae0517173a1dd5d4ee2469b"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.28/Docktor-v0.0.28-macos-x64.zip"
    sha256 "40af4f98899acf3dc645c283c1a68dda33a6c6ff0e9189be8f22c7e22486a014"
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

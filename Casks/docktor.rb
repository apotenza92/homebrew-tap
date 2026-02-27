cask "docktor" do
  version "0.0.18"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.18/Docktor-v0.0.18-macos-arm64.zip"
    sha256 "9c87604397d04308ba69dc423d84c0cb965d5c68b3b4ccddc1d6ebd8bb97a58e"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.18/Docktor-v0.0.18-macos-x64.zip"
    sha256 "9f70490f3299b022b970ae49ad0909f2f1ccff15490f6313372dc1502c0e5ec4"
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

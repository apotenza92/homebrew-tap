cask "dockmint" do
  version "0.4.0"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.0/Dockmint-v0.4.0-macos-arm64.zip"
    sha256 "7ae0f8e89e2956ec8291e8faa37310d4a3fccebf763ab5dd02be9e663605b17c"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.0/Dockmint-v0.4.0-macos-x64.zip"
    sha256 "34ccb6c60f67c8521aa7a00fab6f498d8a342139a8592f3ff697561680dd89c0"
  end

  name "Dockmint"
  desc "Dock gesture actions for macOS"
  homepage "https://github.com/apotenza92/dockmint"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Dockmint.app"

  zap trash: [
    "~/Library/Application Support/Dockmint",
    "~/Library/Application Support/Docktor",
    "~/Library/Caches/pzc.Dockter",
    "~/Library/Caches/pzc.Dockmint",
    "~/Library/Logs/Dockmint",
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Preferences/pzc.Dockmint.plist",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.savedState",
    "~/Code/Dockmint/logs",
    "~/Code/Docktor/logs",
  ]
end

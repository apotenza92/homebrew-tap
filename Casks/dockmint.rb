cask "dockmint" do
  version "0.3.1"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.1/Dockmint-v0.3.1-macos-arm64.zip"
    sha256 "1bd9478b712b00ff07b11f91eb6445acb4e459fba53e8108b4b50282e720fafd"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.1/Dockmint-v0.3.1-macos-x64.zip"
    sha256 "a5428a146391893136a9fbc513029bb12e47e8ed9467f08b5e75b0352207c48d"
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

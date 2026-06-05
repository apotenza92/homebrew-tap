cask "dockmint" do
  version "0.4.0"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.0/Dockmint-v0.4.0-macos-arm64.zip"
    sha256 "fa95981d8199ebf94cef3bcaf66454e641873c06a62b385d41ec0e45014a5798"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.0/Dockmint-v0.4.0-macos-x64.zip"
    sha256 "389c03250cab2a2baa07078bb1b86c4438c3c37a531d7f8fffe28ae5e5d3e7d9"
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

cask "dockmint" do
  version "0.3.2"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.2/Dockmint-v0.3.2-macos-arm64.zip"
    sha256 "91561aaa7f422c9023e64de54155d67d8b9e0ae58b9ef31403f7739e66f714ac"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.2/Dockmint-v0.3.2-macos-x64.zip"
    sha256 "21eb84b006e7c18d8fc484747bfb79596f57c611f5fa89435ddaec211843f0e3"
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

cask "dockmint" do
  version "0.2.1"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.1/Docktor-v0.2.1-macos-arm64.zip"
    sha256 "6d93f933f76b93208d74f8bb7613b4e7f41419f7b25f7802425f7d7b56c307e0"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.1/Docktor-v0.2.1-macos-x64.zip"
    sha256 "251c99651536ac534cc3672abc5d4b45bbaa2b8a835463339a4c5474fa05b84a"
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
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Preferences/pzc.Dockmint.plist",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.savedState",
  ]
end

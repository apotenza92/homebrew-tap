cask "dockmint" do
  version "0.2.8"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.8/Dockmint-v0.2.8-macos-arm64.zip"
    sha256 "1b2511aab343646a79f028d7ca94000b062d2e9d2d68358e63218b1613c18e42"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.8/Dockmint-v0.2.8-macos-x64.zip"
    sha256 "c4212a897e129bcc3cc5c61e36ca2b1d5d44c12855517472656ec33059f755ce"
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

cask "dockmint" do
  version "0.2.3"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-v0.2.3-macos-arm64.zip"
    sha256 "e08a40b4a1780f52d4202cbcd3d2562c71f352d5ef43288a16b48fe522ee0c91"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-v0.2.3-macos-x64.zip"
    sha256 "9f88af6b37ddca1a84f3d8dc99ebe2970179b9028ffc4e88e261ef2c8f05b3e7"
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

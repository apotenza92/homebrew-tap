cask "dockmint" do
  version "0.2.6"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.6/Dockmint-v0.2.6-macos-arm64.zip"
    sha256 "0961c69dab61f58d3f01ab6ba82e3b7fc3eb00044b1312bbffca0ed531432155"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.6/Dockmint-v0.2.6-macos-x64.zip"
    sha256 "468a37aa583b37b734c2dfe561255337052cf97fc7983fec66fc61386b21be51"
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

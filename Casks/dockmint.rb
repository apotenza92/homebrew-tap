cask "dockmint" do
  version "0.2.5"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.5/Dockmint-v0.2.5-macos-arm64.zip"
    sha256 "e35822a549a284f88fc4cd0e8907cd74bfa9dd94fa358c1d32f6c6d2736989d7"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.5/Dockmint-v0.2.5-macos-x64.zip"
    sha256 "66f3285ee28f328109aedf66efd6192d1647198e6d2576e2fba4541fe4df78c5"
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

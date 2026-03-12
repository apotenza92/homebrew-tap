cask "dockmint" do
  version "0.2.3"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-v0.2.3-macos-arm64.zip"
    sha256 "5d1138df6d14b7912dcd257bc7e84018420c0a65804173fc628f985808392e11"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-v0.2.3-macos-x64.zip"
    sha256 "83739afefb621c0cd171482b4d1ef26baddeabe6ea1cb417bff13d13a4375eaf"
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

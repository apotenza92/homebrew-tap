cask "dockmint" do
  version "0.2.3"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-v0.2.3-macos-arm64.zip"
    sha256 "6b80e86e2cae7273b6598c8def700b1e7d50219ea6d29c69edfc6f8515522f22"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-v0.2.3-macos-x64.zip"
    sha256 "aa0b7bfce3ac276b6fccff4a2098c9c7497103cabbdd36ddc2f1391a35f06b1d"
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

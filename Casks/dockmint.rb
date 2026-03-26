cask "dockmint" do
  version "0.3.0"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.0/Dockmint-v0.3.0-macos-arm64.zip"
    sha256 "26d7a0d8c336d61b8c19a471b18584287d731016691affa8748a3854a50645c6"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.0/Dockmint-v0.3.0-macos-x64.zip"
    sha256 "4b06d44f879975d3c79a8cd25db0655cf5007ca5d9902bf12519fd4f901b507d"
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

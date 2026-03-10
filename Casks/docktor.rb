cask "docktor" do
  version "0.1.0"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.0/Docktor-v0.1.0-macos-arm64.zip"
    sha256 "9935a9fd4a848079e9c4f48447b882cf7fbb43851fb40534634d649a3b72b0b5"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.0/Docktor-v0.1.0-macos-x64.zip"
    sha256 "51010c5827874c867490e426e502c4cefa6066cc4b2c975e859b38bb8872e674"
  end

  name "Docktor"
  desc "Dock gesture actions for macOS"
  homepage "https://github.com/apotenza92/docktor"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Docktor.app"

  zap trash: [
    "~/Library/Application Support/Docktor",
    "~/Library/Caches/pzc.Dockter",
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
  ]
end

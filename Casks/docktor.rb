cask "docktor" do
  version "0.0.27"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.27/Docktor-v0.0.27-macos-arm64.zip"
    sha256 "f61f0086df11253ec955496bd6d60fde1190fea4423570877287c611cb6c8b6b"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.27/Docktor-v0.0.27-macos-x64.zip"
    sha256 "323511da53635064b96a85dd43ac4353b90c742ccb4b66b1acdd38d04af86f87"
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

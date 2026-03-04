cask "docktor" do
  version "0.0.29"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.29/Docktor-v0.0.29-macos-arm64.zip"
    sha256 "d35c338ee04c05f1448de00966aeb99470cd30c7e81cab3aef0e00f7610049e7"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.29/Docktor-v0.0.29-macos-x64.zip"
    sha256 "8e0479edda24d911a1f677d36ed06c390694bd1999480859ec46d0074031b996"
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

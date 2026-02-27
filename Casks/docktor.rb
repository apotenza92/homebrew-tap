cask "docktor" do
  version "0.0.12"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.12/Docktor-v0.0.12-macos-arm64.zip"
    sha256 "d7ea0a7e1842903a50e63c03d814440db524d6474f4061a54b1e140e09c2dee6"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.12/Docktor-v0.0.12-macos-x64.zip"
    sha256 "69ca1d54d2a3799ebc447cef1c4717314a390da046f2303989996e590c19625b"
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

cask "docktor" do
  version "0.0.21"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.21/Docktor-v0.0.21-macos-arm64.zip"
    sha256 "3624cef21e3cfa02ce33de867a6521be459ecf660f0328ef4ba8ab4ebfc9a5e9"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.21/Docktor-v0.0.21-macos-x64.zip"
    sha256 "83864481df230c4ed09fb543ebb340d0ea8ed1b7283f17a730e2873ff56d2eb1"
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

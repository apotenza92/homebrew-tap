cask "docktor" do
  version "0.0.33"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.33/Docktor-v0.0.33-macos-arm64.zip"
    sha256 "fa46d09e6b0397b0e5280e1b0d8843c3313bdfda93ed61aaacc3f1bd8a3d7773"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.33/Docktor-v0.0.33-macos-x64.zip"
    sha256 "828315a37240ce0e17899829130e9396ef91cbae702857630b397ec6f52d09f2"
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

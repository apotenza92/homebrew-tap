cask "docktor" do
  version "0.0.32"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.32/Docktor-v0.0.32-macos-arm64.zip"
    sha256 "9c3f75fad4148467f4b64ddfa749cac8c941ca28fc6963447e04b8f02b36ca87"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.32/Docktor-v0.0.32-macos-x64.zip"
    sha256 "91e7838fa326460738918cc9676c531c8d3cd4a017146dcfa38acf72bfbf0297"
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

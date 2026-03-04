cask "docktor" do
  version "0.0.26"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.26/Docktor-v0.0.26-macos-arm64.zip"
    sha256 "c5254148bb4e5ebcd926b986e3bae8c8fbd0a659b276747e5f74b90255037d9b"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.26/Docktor-v0.0.26-macos-x64.zip"
    sha256 "e24427b7cd4b329235a96d6434eb1ea2b4d608dc0cb8a6405baa058193022f79"
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

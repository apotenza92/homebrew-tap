cask "docktor" do
  version "0.1.1"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.1/Docktor-v0.1.1-macos-arm64.zip"
    sha256 "402f9a887a7b9deb413be9b45f8ad339d04a9e353a61807f92d94b983168265e"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.1/Docktor-v0.1.1-macos-x64.zip"
    sha256 "48e9eb128ff07de14cd21c7b19638c656b829c0b2522bf456574b9493a3e21d2"
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

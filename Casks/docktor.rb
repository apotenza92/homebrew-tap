cask "docktor" do
  version "0.0.34"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.34/Docktor-v0.0.34-macos-arm64.zip"
    sha256 "00e238ea9dccffe5ac4e852167c881928a2c2ecca8254e685ca4b3375d0b4527"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.34/Docktor-v0.0.34-macos-x64.zip"
    sha256 "4bbd3f0231675ab5e42553a9a064990bf5342a91235cb5b16433df61c24f78d0"
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

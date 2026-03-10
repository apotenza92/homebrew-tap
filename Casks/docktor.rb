cask "docktor" do
  version "0.0.38"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.38/Docktor-v0.0.38-macos-arm64.zip"
    sha256 "956d1d6eda645bfcd89983bf98cea45832057e02a1b039e2be30d421a657975a"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.38/Docktor-v0.0.38-macos-x64.zip"
    sha256 "cbd16da5eb2767c7db85964b1e69d977ae8ea23088019ee9be77d1ce4fcc5af3"
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

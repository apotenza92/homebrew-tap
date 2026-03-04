cask "docktor" do
  version "0.0.30"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.30/Docktor-v0.0.30-macos-arm64.zip"
    sha256 "2c4851f796a1ae4fc129f0103b1ded6eceefcb94129d648027847e0f6202a62f"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.30/Docktor-v0.0.30-macos-x64.zip"
    sha256 "d8640b9ba5ce6bfb66479c53e7d8ddd74c02dc52e9bf7bd7b868c048bfb9796a"
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

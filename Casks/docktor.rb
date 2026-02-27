cask "docktor" do
  version "0.0.15"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.15/Docktor-v0.0.15-macos-arm64.zip"
    sha256 "e605eff293f3325fec393f5534d4679f95c0502bde5e1fd7db3e52d1cc407a3c"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.15/Docktor-v0.0.15-macos-x64.zip"
    sha256 "d419a3b3ec80be9daf40db802396b0f91bc1aca0a4dd85924cff6761ce76fe47"
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

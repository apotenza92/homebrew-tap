cask "docktor" do
  version "0.0.19"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.19/Docktor-v0.0.19-macos-arm64.zip"
    sha256 "fb5d17bbf7b26cdf28c033d6e4ce447f4aa20d21df6e39f2b84a4bfa06e18d40"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.19/Docktor-v0.0.19-macos-x64.zip"
    sha256 "044dfe5501ec83c642b888b58811cfe38f8a79ec9cd5ee1190d79879feee5e69"
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

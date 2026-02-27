cask "docktor" do
  version "0.0.17"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.17/Docktor-v0.0.17-macos-arm64.zip"
    sha256 "fedd9ed4d097af5d1a669a1ccd96771150b458e28fbbd6e014eec02308d8717f"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.17/Docktor-v0.0.17-macos-x64.zip"
    sha256 "cc9ea1a221b1684f8d1a4d7a7e31cd271cda46e19f656ba3e6dc361d0f4d866e"
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

cask "docktor" do
  version "0.0.13"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.13/Docktor-v0.0.13-macos-arm64.zip"
    sha256 "5813e9c0b50f2322529386b43d6879388b673c0fd2bb88c3cf32f523cc8c1f84"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.13/Docktor-v0.0.13-macos-x64.zip"
    sha256 "95591adffaa8abc7ca5772f0acbf0e4080fc8ad56a9b30319f56a2456890f43b"
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

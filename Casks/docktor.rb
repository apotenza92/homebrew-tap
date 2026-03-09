cask "docktor" do
  version "0.0.37"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.37/Docktor-v0.0.37-macos-arm64.zip"
    sha256 "fae5b2845f2cf3224b789cd0e45dd7af3211f73e7b5e7ee4a56cf94707194b10"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.37/Docktor-v0.0.37-macos-x64.zip"
    sha256 "515b6e4dc505e3c42fcb1dd209db5eb7938e41b14c5c4dc04fd0163193525adf"
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

cask "docktor" do
  version "0.0.39"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.39/Docktor-v0.0.39-macos-arm64.zip"
    sha256 "fcd45068a288b9f0b024a9f9fb450caa890f0bbf638551422b3e32da13c28321"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.39/Docktor-v0.0.39-macos-x64.zip"
    sha256 "422f09e1c40685f6dc85a406a5c890411012cb7847f82e36e6c357d569868c0d"
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

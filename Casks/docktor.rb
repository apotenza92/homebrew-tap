cask "docktor" do
  version "0.0.20"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.20/Docktor-v0.0.20-macos-arm64.zip"
    sha256 "d4a4096d8f4d2bfb417f37ec972234b14225d6a25dce41bccd3305410f820aae"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.20/Docktor-v0.0.20-macos-x64.zip"
    sha256 "abf8045f94810dc4edffa81317c3df2b5f7bb2cb47d263c96f244c386ba1ab34"
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

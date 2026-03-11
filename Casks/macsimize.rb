cask "macsimize" do
  version "0.3.3"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.3/Macsimize-v0.3.3-macos-arm64.zip"
    sha256 "a43529e8d5399aa87184646ac79799fe23833c875370544e251df1fbb866e80c"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.3/Macsimize-v0.3.3-macos-x64.zip"
    sha256 "d90f20a4b4081ad1bab173d26c780e5de401c927fe695d10fa8e4a43fb0e4894"
  end

  name "Macsimize"
  desc "Green-button maximize and full-screen remapper for macOS"
  homepage "https://github.com/apotenza92/macsimize"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Macsimize.app"

  zap trash: [
    "~/Library/Application Support/Macsimize",
    "~/Library/Caches/pzc.Macsimize",
    "~/Library/Preferences/pzc.Macsimize.plist",
    "~/Library/Saved Application State/pzc.Macsimize.savedState",
  ]
end

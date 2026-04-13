cask "macsimize" do
  version "0.3.8"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.8/Macsimize-v0.3.8-macos-arm64.zip"
    sha256 "13d5c17b2fed12aed0c2f7b8022c54c423827e40f5a5cb4faa48ae48aa2e218f"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.8/Macsimize-v0.3.8-macos-x64.zip"
    sha256 "922e8d37036b849cd34c183dd5947c1fdaf0fe4a2bafa49e7d873a1625bbe979"
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

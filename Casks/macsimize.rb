cask "macsimize" do
  version "0.3.8"

  on_arm do
    sha256 "13d5c17b2fed12aed0c2f7b8022c54c423827e40f5a5cb4faa48ae48aa2e218f"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "922e8d37036b849cd34c183dd5947c1fdaf0fe4a2bafa49e7d873a1625bbe979"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-v#{version}-macos-x64.zip"
  end

  name "Macsimize"
  desc "Green-button maximize and full-screen remapper"
  homepage "https://github.com/apotenza92/macsimize"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Macsimize.app"

  zap trash: [
    "~/Library/Application Support/Macsimize",
    "~/Library/Caches/pzc.Macsimize",
    "~/Library/Preferences/pzc.Macsimize.plist",
    "~/Library/Saved Application State/pzc.Macsimize.savedState",
  ]
end

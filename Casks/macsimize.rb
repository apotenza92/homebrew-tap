cask "macsimize" do
  version "0.3.0"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.0/Macsimize-v0.3.0-macos-arm64.zip"
    sha256 "220694553bed651edd624f6ea3a822505870efd5a131e20d048fc7f15b228e9e"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.0/Macsimize-v0.3.0-macos-x64.zip"
    sha256 "eb2bbfe48b4c2e05a885d7ba6ca1defc5f7debde813f49cb1ca04a65c17fdad6"
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

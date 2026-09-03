cask "macsimize" do
  version "0.3.15"

  on_arm do
    sha256 "51ef3dd05fb4c8be6cc2d22c407ebb47c03deec7dcda4b08c9edaf7138681621"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "d5edc452b89339124bf7936934f0d6645eb809a91d412b699b094629563dfc77"

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

cask "macsimize" do
  version "0.3.16"

  on_arm do
    sha256 "05161deff1d4600813c64ff714b907edd3b29c48b59b0d1a9bbefabd31b3bb94"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "b3a92405983890d865650067ecd9e97c7f999c481860dcd00ab25293da9a5e6d"

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

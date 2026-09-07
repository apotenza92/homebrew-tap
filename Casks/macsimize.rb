cask "macsimize" do
  version "0.3.20"

  on_arm do
    sha256 "fa93f7988afdb8c97299818138f34a65e8cb91a9b52e57061051e3c3f7f064ff"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "e77b2fcea0bcc4aaac94aeaa55d7f62dbb6bd8b3cefd57f5679f14b731b8c792"

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

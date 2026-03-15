cask "macsimize" do
  version "0.3.6"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.6/Macsimize-v0.3.6-macos-arm64.zip"
    sha256 "46497cd597950c284f1ab765181127b537612d4a618e0dab1737cf0f7ea49505"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.6/Macsimize-v0.3.6-macos-x64.zip"
    sha256 "313a86b42b296229d0418781e50b97513d8ba8652d7b66b37832a7734f2c4da3"
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

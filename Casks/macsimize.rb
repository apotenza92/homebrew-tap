cask "macsimize" do
  version "0.2.14"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.14/Macsimize-v0.2.14-macos-arm64.zip"
    sha256 "de5d21bf5283595b6cdd69e7fabb354a46844ed44ac7992646e9f4d2ad0e3303"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.14/Macsimize-v0.2.14-macos-x64.zip"
    sha256 "e7520865608b9cd0048b456853b965f13704b9996fcdc5c909477623c812d53f"
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

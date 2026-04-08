cask "macsimize" do
  version "0.3.7"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.7/Macsimize-v0.3.7-macos-arm64.zip"
    sha256 "28a13586ac653ba5d1cdc5076bf83d47ea7aa1d5f647d0998565c6e94191be72"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.7/Macsimize-v0.3.7-macos-x64.zip"
    sha256 "61b051f8a846be6adbaad0bb3d1b0e71eaa951441860948874874ed173b9f48c"
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

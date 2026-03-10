cask "macsimize" do
  version "0.2.11"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.11/Macsimize-v0.2.11-macos-arm64.zip"
    sha256 "e4e17718ac2c2e3c572fc4768b898524e2373d161a0115efd016136efeb4650d"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.11/Macsimize-v0.2.11-macos-x64.zip"
    sha256 "72de0d2411f2ad7137b97268bdf13e58e1d7561f47adc18311d12b72db07dec8"
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

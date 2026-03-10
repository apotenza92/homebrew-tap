cask "macsimize" do
  version "0.2.12"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.12/Macsimize-v0.2.12-macos-arm64.zip"
    sha256 "dbbd3c697920cd0a25e7dfe26fd39816aac7e61e7fcef359f93ce66f50acd155"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.12/Macsimize-v0.2.12-macos-x64.zip"
    sha256 "a58d5f5c0e36bf7f9a2ce49bd92d9cfe5018ac5b302ba70dca4bb9406a052f3d"
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

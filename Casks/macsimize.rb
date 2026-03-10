cask "macsimize" do
  version "0.2.10"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.10/Macsimize-v0.2.10-macos-arm64.zip"
    sha256 "ae3b119e6c034dedab6360a07314eee701fa0aabc0c981cba0208eef9f9281cc"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.10/Macsimize-v0.2.10-macos-x64.zip"
    sha256 "96b498164d875a4c46650c555b7b9f742d67338defd91ddb4dc137e687e48f78"
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

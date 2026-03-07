cask "macsimize" do
  version "0.2.3"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.3/Macsimize-v0.2.3-macos-arm64.zip"
    sha256 "bebb637f80be7542fd588407745936de6fc71282650fe8dbd77924246972c7ab"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.3/Macsimize-v0.2.3-macos-x64.zip"
    sha256 "8c153ec964fa1a8dbcc4afb66a13d194ac25a083cab6ece4d17507a5990faf3b"
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

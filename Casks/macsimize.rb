cask "macsimize" do
  version "0.2.5"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.5/Macsimize-v0.2.5-macos-arm64.zip"
    sha256 "c8f0291cd30b6659d43123a388f513f2fdecd9bee857b534c9b281d045a80a4c"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.5/Macsimize-v0.2.5-macos-x64.zip"
    sha256 "08f946e7c7407978143fa6748639f46ec8798aa4ff3f6e5806239b391b3f73b9"
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

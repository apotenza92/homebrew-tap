cask "macsimize" do
  version "0.3.2"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.2/Macsimize-v0.3.2-macos-arm64.zip"
    sha256 "3ebf17e9ce87334f1268c1ff7c751feb3e8d2b58be19e0ff5547c7ea8f5f9e16"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.2/Macsimize-v0.3.2-macos-x64.zip"
    sha256 "f1770c2dfa0fb50688ac64f7af19051f9817650432f23284632c8d3265fc88df"
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

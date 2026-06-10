cask "caul" do
  version "0.1.19"

  on_arm do
    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-macos-arm64.zip"
    sha256 "0bf7cdb83d711be75c835326d4bea2846cd6902231d109272f5c25b7e36782ba"
  end

  name "Caul"
  desc "Private desktop assistant for live calls and screen work"
  homepage "https://github.com/apotenza92/caul"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Caul.app"

  zap trash: [
    "~/Library/Application Support/Caul",
    "~/Library/Caches/dev.caul.app",
    "~/Library/Caches/dev.caul.app.ShipIt",
    "~/Library/Preferences/dev.caul.app.plist",
    "~/Library/Saved Application State/dev.caul.app.savedState",
  ]
end

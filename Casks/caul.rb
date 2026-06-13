cask "caul" do
  version "0.1.21"

  on_arm do
    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-macos-arm64.zip"
    sha256 "75af4b23c1db2ecd4deae361bd36480f94047519ec78041e158723ffd154a740"
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

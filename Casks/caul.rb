cask "caul" do
  version "0.1.20"

  on_arm do
    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-macos-arm64.zip"
    sha256 "48a8cc6736416de73682e690c5f384c6a644336af237694cdd8af2bc6de9fdc4"
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

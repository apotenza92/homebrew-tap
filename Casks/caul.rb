cask "caul" do
  version "0.1.16"

  on_arm do
    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-macos-arm64.zip"
    sha256 "2a900b0258140e065d90ac317288438c5b1e815465da57538f2c8e394432940e"
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

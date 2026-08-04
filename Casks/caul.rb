cask "caul" do
  version "0.1.75"

  on_arm do
    sha256 "0bb62a6a6aaf6fceec7aa242f6e368967252171d812863d0d2cc0e29bf25e5c2"

    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-macos-arm64.zip"
  end

  name "Caul"
  desc "Private desktop assistant for live calls and screen work"
  homepage "https://github.com/apotenza92/caul"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Caul.app"

  zap trash: [
    "~/Library/Application Support/Caul",
    "~/Library/Caches/dev.caul.app",
    "~/Library/Caches/dev.caul.app.ShipIt",
    "~/Library/Preferences/dev.caul.app.plist",
    "~/Library/Saved Application State/dev.caul.app.savedState",
  ]
end

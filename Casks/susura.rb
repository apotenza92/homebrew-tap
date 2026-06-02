cask "susura" do
  version "0.1.6"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v#{version}/Susura-macos-arm64.zip"
    sha256 "d3dff1e86baa239f9e33e7e4dc2b7fb01a4910c70687795002f54c37d272df3a"
  end

  name "Susura"
  desc "Private desktop assistant for live calls and screen work"
  homepage "https://github.com/apotenza92/susura"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Susura.app"

  zap trash: [
    "~/Library/Application Support/Susura",
    "~/Library/Caches/dev.susura.app",
    "~/Library/Caches/dev.susura.app.ShipIt",
    "~/Library/Preferences/dev.susura.app.plist",
    "~/Library/Saved Application State/dev.susura.app.savedState",
  ]
end

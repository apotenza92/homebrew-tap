cask "susura" do
  version "0.1.12"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v#{version}/Susura-macos-arm64.zip"
    sha256 "b6f79dc0ea8725131c601b426126d97887962664a72af8be19d32b6035b9c38a"
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

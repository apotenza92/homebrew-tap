cask "susura" do
  version "0.1.11"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v#{version}/Susura-macos-arm64.zip"
    sha256 "552198eceab728cff6ac9fad45924fbe87a1a94ad76b710784557303e76c33ce"
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

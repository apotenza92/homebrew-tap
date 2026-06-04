cask "susura" do
  version "0.1.9"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v#{version}/Susura-macos-arm64.zip"
    sha256 "ad7acb600212eac191fc9c0ae576d315642a826a3da0ff62d02d6e4cee4bc4e8"
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

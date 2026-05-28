cask "susura" do
  version "0.1.5"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v0.1.5/Susura-macos-arm64.zip"
    sha256 "5d14f1a77e2e5abb7578db61b55eea05bf213efd313cfa4011ca3b7e02031edf"
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

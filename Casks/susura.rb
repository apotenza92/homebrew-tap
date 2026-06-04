cask "susura" do
  version "0.1.10"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v#{version}/Susura-macos-arm64.zip"
    sha256 "18d44a55cad9f1557e0b98fdbe85a0067dff43ed251d89b16ba52aa91277d287"
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

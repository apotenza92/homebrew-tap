cask "caul" do
  version "0.1.74"

  on_arm do
    sha256 "4c3466e7b5178660b2a55ddf140182c190a021614ebb051b1fc6293d402a66b3"

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

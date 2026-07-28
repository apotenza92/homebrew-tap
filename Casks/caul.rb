cask "caul" do
  version "0.1.42"

  on_arm do
    sha256 "b91f1a5449c94ddd2d9df5a26c2f08546a26e431d9ec72ab06afd602cbf9359f"

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

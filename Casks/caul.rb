cask "caul" do
  version "0.1.43"

  on_arm do
    sha256 "cba8e09d1dcbd2271b617b04ba0968856266f96466d57b9f143214a4c20068ca"

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

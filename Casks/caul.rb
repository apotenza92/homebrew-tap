cask "caul" do
  version "0.1.18"

  on_arm do
    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-macos-arm64.zip"
    sha256 "d43854420be3617bd50c7909e15238c9405626a3f2c139c7e03bb0e817e2ea48"
  end

  name "Caul"
  desc "Private desktop assistant for live calls and screen work"
  homepage "https://github.com/apotenza92/caul"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Caul.app"

  zap trash: [
    "~/Library/Application Support/Caul",
    "~/Library/Caches/dev.caul.app",
    "~/Library/Caches/dev.caul.app.ShipIt",
    "~/Library/Preferences/dev.caul.app.plist",
    "~/Library/Saved Application State/dev.caul.app.savedState",
  ]
end

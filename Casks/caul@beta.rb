cask "caul@beta" do
  version "0.1.16"

  on_arm do
    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-Beta-macos-arm64.zip"
    sha256 "73c2051d847cf623f862059a8b3266883d14594735e8ff2a87445b683debcaa2"
  end

  name "Caul Beta"
  desc "Beta channel for Caul"
  homepage "https://github.com/apotenza92/caul"

  livecheck do
    url "https://api.github.com/repos/apotenza92/caul/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Caul Beta.app"

  zap trash: [
    "~/Library/Application Support/Caul Beta",
    "~/Library/Caches/dev.caul.app.beta",
    "~/Library/Caches/dev.caul.app.beta.ShipIt",
    "~/Library/Preferences/dev.caul.app.beta.plist",
    "~/Library/Saved Application State/dev.caul.app.beta.savedState",
  ]
end

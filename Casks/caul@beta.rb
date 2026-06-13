cask "caul@beta" do
  version "0.1.21"

  on_arm do
    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-Beta-macos-arm64.zip"
    sha256 "6b12c70d8386fe1bbcdc26aa0ac35bc8172b0304379a0409bdbc5429d1806c40"
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

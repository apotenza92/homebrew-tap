cask "susura@beta" do
  version "0.1.5"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v0.1.5/Susura-Beta-macos-arm64.zip"
    sha256 "36036431526781ffa2e1c14d7ba136273d8f16d22196e8f9f5566ebc76711bd6"
  end

  name "Susura Beta"
  desc "Beta channel for Susura"
  homepage "https://github.com/apotenza92/susura"

  livecheck do
    url "https://api.github.com/repos/apotenza92/susura/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Susura Beta.app"

  zap trash: [
    "~/Library/Application Support/Susura Beta",
    "~/Library/Caches/dev.susura.app.beta",
    "~/Library/Caches/dev.susura.app.beta.ShipIt",
    "~/Library/Preferences/dev.susura.app.beta.plist",
    "~/Library/Saved Application State/dev.susura.app.beta.savedState",
  ]
end

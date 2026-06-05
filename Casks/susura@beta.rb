cask "susura@beta" do
  version "0.1.15"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v#{version}/Susura-Beta-macos-arm64.zip"
    sha256 "d7694b6ce93441e02ce620a93d3193cec7ea3b0a1e6df5e2bac4eb22c490a1ff"
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

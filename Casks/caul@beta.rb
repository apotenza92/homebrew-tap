cask "caul@beta" do
  version "0.1.75"

  on_arm do
    sha256 "8e7f6479514f7bb38877908d8c4843dc0634239b66b5f472a2cab7f0d2114ba5"

    url "https://github.com/apotenza92/caul/releases/download/v#{version}/Caul-Beta-macos-arm64.zip"
  end

  name "Caul Beta"
  desc "Beta channel for Caul"
  homepage "https://github.com/apotenza92/caul"

  livecheck do
    url "https://api.github.com/repos/apotenza92/caul/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"].delete_prefix("v") }
    end
  end

  depends_on macos: :sonoma

  app "Caul Beta.app"

  zap trash: [
    "~/Library/Application Support/Caul Beta",
    "~/Library/Caches/dev.caul.app.beta",
    "~/Library/Caches/dev.caul.app.beta.ShipIt",
    "~/Library/Preferences/dev.caul.app.beta.plist",
    "~/Library/Saved Application State/dev.caul.app.beta.savedState",
  ]
end

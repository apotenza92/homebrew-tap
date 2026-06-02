cask "susura@beta" do
  version "0.1.6"

  on_arm do
    url "https://github.com/apotenza92/susura/releases/download/v#{version}/Susura-Beta-macos-arm64.zip"
    sha256 "1b7299d405643e37e3ac4a372efbbd1c17ea6bd1ef32c44035dbb374a4156ec2"
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

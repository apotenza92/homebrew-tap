cask "macsimize@beta" do
  version "0.3.6"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.6/Macsimize-Beta-v0.3.6-macos-arm64.zip"
    sha256 "0a3aadbc0cea9fd6d4dbb93c599bcf5f5484ee9c8094a77fd2a7298b3656ce8a"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.6/Macsimize-Beta-v0.3.6-macos-x64.zip"
    sha256 "0b216b81054abc0eee84d8a8095ed676b8bb08249241e93890b480fb0617e6a9"
  end

  name "Macsimize Beta"
  desc "Beta channel for Macsimize"
  homepage "https://github.com/apotenza92/macsimize"

  livecheck do
    url "https://api.github.com/repos/apotenza92/macsimize/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Macsimize Beta.app"

  zap trash: [
    "~/Library/Application Support/Macsimize Beta",
    "~/Library/Caches/pzc.Macsimize.beta",
    "~/Library/Preferences/pzc.Macsimize.beta.plist",
    "~/Library/Saved Application State/pzc.Macsimize.beta.savedState",
  ]
end

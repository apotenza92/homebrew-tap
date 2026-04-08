cask "macsimize@beta" do
  version "0.3.7"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.7/Macsimize-Beta-v0.3.7-macos-arm64.zip"
    sha256 "786ccf60c1f17df6f2acf63dea2c0b668f11a22ce9767dacec001829abd21a9d"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.7/Macsimize-Beta-v0.3.7-macos-x64.zip"
    sha256 "2961209d53b677b94b3c03cb3b7a821becd1855228fc044bf32cfada2fad399b"
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

cask "macsimize@beta" do
  version "0.3.2"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.2/Macsimize-Beta-v0.3.2-macos-arm64.zip"
    sha256 "4e2521fa96c5af911eb1c287763b80999005c91b37be2b343563833a7bf3f3cb"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.2/Macsimize-Beta-v0.3.2-macos-x64.zip"
    sha256 "beb8aeb4b497170ed5b6adc11242186498384d081de46de91170742e023cf31a"
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

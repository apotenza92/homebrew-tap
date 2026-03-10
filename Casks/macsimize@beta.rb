cask "macsimize@beta" do
  version "0.2.10-beta.1"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.10-beta.1/Macsimize-Beta-v0.2.10-beta.1-macos-arm64.zip"
    sha256 "250b68dbaa504a5c7a9280716567a6073d031c5b68993a4f4b46b64ded0f77ca"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.10-beta.1/Macsimize-Beta-v0.2.10-beta.1-macos-x64.zip"
    sha256 "70bcc98ca141b3cc5dd46bd8bf681c447f8ec3bdb5b945e332189e95a3ffae65"
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

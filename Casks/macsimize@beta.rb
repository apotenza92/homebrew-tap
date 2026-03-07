cask "macsimize@beta" do
  version "0.2.2"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.2/Macsimize-Beta-v0.2.2-macos-arm64.zip"
    sha256 "980d8a09e2f92e9d05658f03e62f9267b2243db23a40ed3b5dc996793b8b869a"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.2/Macsimize-Beta-v0.2.2-macos-x64.zip"
    sha256 "9ffda5e4ec7a4a08eeab29c60d6c5e563fe5c8442382ce718f28270e60cc1ec9"
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

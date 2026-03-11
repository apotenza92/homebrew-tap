cask "macsimize@beta" do
  version "0.3.3"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.3/Macsimize-Beta-v0.3.3-macos-arm64.zip"
    sha256 "362b80b7998d9fdb83bf9c1cb94ca853e49370b3bbbdcf81b5042f8099e9e59b"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.3/Macsimize-Beta-v0.3.3-macos-x64.zip"
    sha256 "215ad3427efe6e294529e814f29f3cffa4da77d592d9289768a3fddf9999b2c9"
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

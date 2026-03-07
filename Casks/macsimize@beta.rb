cask "macsimize@beta" do
  version "0.2.1"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.1/Macsimize-Beta-v0.2.1-macos-arm64.zip"
    sha256 "75f567595ca7e63f28037359f21b534a08446c13434bc033b4696f9e0e238500"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.1/Macsimize-Beta-v0.2.1-macos-x64.zip"
    sha256 "bfa623494c366173d3366a0b2ea5661702aa417a3eeac289a9d67f377d7199ce"
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

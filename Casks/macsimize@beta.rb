cask "macsimize@beta" do
  version "0.2.4"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.4/Macsimize-Beta-v0.2.4-macos-arm64.zip"
    sha256 "ed5983db4b62959400399912d3190440a25d49e0345b3e8268c9b56c322400a7"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.4/Macsimize-Beta-v0.2.4-macos-x64.zip"
    sha256 "ee8ad49fedc9988bdfa7b286d941a535c8a1b0e4b1217123c8258cdb3e304eab"
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

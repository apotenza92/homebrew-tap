cask "macsimize@beta" do
  version "0.3.15"

  on_arm do
    sha256 "759c3d848bc2970745bde10fc9cdaa0121e965616822fbcd3a66b06d563ea7c7"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "6c7ce191b7c5774900015667fc0d464f06424741c2b0434ba8689f4f1925de22"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-Beta-v#{version}-macos-x64.zip"
  end

  name "Macsimize Beta"
  desc "Beta channel for Macsimize"
  homepage "https://github.com/apotenza92/macsimize"

  livecheck do
    url "https://api.github.com/repos/apotenza92/macsimize/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"].delete_prefix("v") }
    end
  end

  depends_on macos: :sonoma

  app "Macsimize Beta.app"

  zap trash: [
    "~/Library/Application Support/Macsimize Beta",
    "~/Library/Caches/pzc.Macsimize.beta",
    "~/Library/Preferences/pzc.Macsimize.beta.plist",
    "~/Library/Saved Application State/pzc.Macsimize.beta.savedState",
  ]
end

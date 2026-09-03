cask "macsimize@beta" do
  version "0.3.16"

  on_arm do
    sha256 "0c30965f3826390b74b9f6a63dbbcac985304114e4bd0f1a24bcafdc85f96a5a"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "089d3207ceaa93162731a9f1dde44336025aa5fff3f866713b3b4599a136a796"

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

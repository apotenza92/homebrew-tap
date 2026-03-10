cask "macsimize@beta" do
  version "0.3.1"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.1/Macsimize-Beta-v0.3.1-macos-arm64.zip"
    sha256 "43e4d8a822da1a36f540a5d1195814b82731b8aeaccf655383db9ef7af8cad66"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.1/Macsimize-Beta-v0.3.1-macos-x64.zip"
    sha256 "bfc251f5b6568996ddb171fe2898ead86a0b9d52f020b266d6e44464defdf2ed"
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

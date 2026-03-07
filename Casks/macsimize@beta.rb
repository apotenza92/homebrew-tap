cask "macsimize@beta" do
  version "0.2.5"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.5/Macsimize-Beta-v0.2.5-macos-arm64.zip"
    sha256 "3382c2216df1b4a10e1deb97ae305cc683621b646df8c5faa69ade667736e097"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.5/Macsimize-Beta-v0.2.5-macos-x64.zip"
    sha256 "5f65ee83862672cd169d4f8f7ad7e3d31e8e5790965c204243d32288ffcf0b46"
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

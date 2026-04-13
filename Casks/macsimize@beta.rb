cask "macsimize@beta" do
  version "0.3.8"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.8/Macsimize-Beta-v0.3.8-macos-arm64.zip"
    sha256 "d38f677f931de8ddccefed78997af1e8767f9179dceab30991a2048ab3f4d454"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.8/Macsimize-Beta-v0.3.8-macos-x64.zip"
    sha256 "1a1fd284bf38abdd8aff352682521beae53bf54b07e1e0a884a733adac14bec8"
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

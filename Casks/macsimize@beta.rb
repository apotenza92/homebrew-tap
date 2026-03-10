cask "macsimize@beta" do
  version "0.2.14"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.14/Macsimize-Beta-v0.2.14-macos-arm64.zip"
    sha256 "723527f733350f28fd6dc04f5d205c1e855facb99b9ed19e8f575b5a3ba124c2"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.14/Macsimize-Beta-v0.2.14-macos-x64.zip"
    sha256 "37ce51d5ec45f844bac0fc7c0d7de83deebe2735d53954eaec94d2d081790a90"
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

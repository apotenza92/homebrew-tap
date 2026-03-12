cask "macsimize@beta" do
  version "0.3.4"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.4/Macsimize-Beta-v0.3.4-macos-arm64.zip"
    sha256 "f5f28585d13b8ba5b26d9299c1511363212a410ae3646dfca382e62b7fa9c7bb"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.4/Macsimize-Beta-v0.3.4-macos-x64.zip"
    sha256 "d46606d4bbf372e71490ce45ecece6a48ce77ef5d4aa5e327126f550b8b81041"
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

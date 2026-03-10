cask "macsimize@beta" do
  version "0.2.15"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.15/Macsimize-Beta-v0.2.15-macos-arm64.zip"
    sha256 "434cf26a3b7015dcad3c9e73650dbab302bfef77c1b4bc6e1604d709b5dbb258"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.15/Macsimize-Beta-v0.2.15-macos-x64.zip"
    sha256 "41f5dd6d9c527880dad5a6168a8bb1de2b8d396a8e4e1b57d960f830bb662cc8"
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

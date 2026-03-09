cask "macsimize@beta" do
  version "0.2.6"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.6/Macsimize-Beta-v0.2.6-macos-arm64.zip"
    sha256 "eb7bc4ba674470a644a61b80c48c7d2f863d153d60d7595d41e5b32b9d9bc72c"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.6/Macsimize-Beta-v0.2.6-macos-x64.zip"
    sha256 "3db328f3a6b9e03828bd0d24b50a4f42446fa51f33bbae10e90f9f468dbd1a00"
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

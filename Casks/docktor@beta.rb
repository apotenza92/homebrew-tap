cask "docktor@beta" do
  version "0.0.19"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.19/Docktor-Beta-v0.0.19-macos-arm64.zip"
    sha256 "5de213460316b03892153935c0f50c6853af7fd51e07811bcd57ef7cdf90a9e9"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.19/Docktor-Beta-v0.0.19-macos-x64.zip"
    sha256 "7dd2b6c7662fc13abf59acc86879ca78c7e4a83e4f3e42dba91c6995c3bc6941"
  end

  name "Docktor Beta"
  desc "Beta channel for Docktor"
  homepage "https://github.com/apotenza92/docktor"

  livecheck do
    url "https://api.github.com/repos/apotenza92/docktor/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Docktor Beta.app"

  zap trash: [
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
  ]
end

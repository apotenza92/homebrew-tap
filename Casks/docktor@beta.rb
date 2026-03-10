cask "docktor@beta" do
  version "0.1.2"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.2/Docktor-Beta-v0.1.2-macos-arm64.zip"
    sha256 "3966138f2ac1ed169f4dd19af3785fd05730aee6994fadb60ae2319582e86bb8"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.2/Docktor-Beta-v0.1.2-macos-x64.zip"
    sha256 "6c26d98c75dd646f9523f61dc6c4a151023ac1ea23d1fae1eec9d6b458054722"
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

cask "docktor@beta" do
  version "0.0.37"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.37/Docktor-Beta-v0.0.37-macos-arm64.zip"
    sha256 "5e4b6d1e40b57893fabe078898f8d219e4768ad6ba7d2a7689973fcdcf5b8beb"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.37/Docktor-Beta-v0.0.37-macos-x64.zip"
    sha256 "c23c059da407a0329a7ca693c281f8393b1d967d04c9e183ceb4d31afbd73a28"
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

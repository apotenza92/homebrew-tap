cask "docktor@beta" do
  version "0.0.27"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.27/Docktor-Beta-v0.0.27-macos-arm64.zip"
    sha256 "6ddddb34176b6e3adfb960a0cc6a62304fb108462edfd630d93ed5fa454da1e0"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.27/Docktor-Beta-v0.0.27-macos-x64.zip"
    sha256 "312024a5a16be7cc2ac2bc5009666eac12aac7b3c979df9188920c81da0d1781"
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

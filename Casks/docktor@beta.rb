cask "docktor@beta" do
  version "0.0.12"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.12/Docktor-Beta-v0.0.12-macos-arm64.zip"
    sha256 "6176f2e6aea9e282f27e18a230e31ded286e5cb39d5c38625783548579561348"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.12/Docktor-Beta-v0.0.12-macos-x64.zip"
    sha256 "721ab347aec7713f9f7c207d9ca46fab7a86d9be3937be336d311874d620006b"
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

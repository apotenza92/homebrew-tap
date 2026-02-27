cask "docktor@beta" do
  version "0.0.15"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.15/Docktor-Beta-v0.0.15-macos-arm64.zip"
    sha256 "9023b5594ca3246df4821339c8f07d08645d8648424c98f9435fbb1835039604"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.15/Docktor-Beta-v0.0.15-macos-x64.zip"
    sha256 "7c08cc8d3cbd0b1f8d3379f55f3d60739d867ee3377ce6bdb8ea15fac2d40362"
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

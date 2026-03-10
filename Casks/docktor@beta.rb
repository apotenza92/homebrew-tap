cask "docktor@beta" do
  version "0.1.0"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.0/Docktor-Beta-v0.1.0-macos-arm64.zip"
    sha256 "e9e04b5bb49dae6ee37bf806ed40f5b59f142a7d1fe06b3d0d47d11c33b5f743"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.0/Docktor-Beta-v0.1.0-macos-x64.zip"
    sha256 "482fcaeba50749f334bdb8b18cb0dfc535391aaa76aa481035330b6a6ab57051"
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

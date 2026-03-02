cask "docktor@beta" do
  version "0.0.21"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.21/Docktor-Beta-v0.0.21-macos-arm64.zip"
    sha256 "9e02fd2baeb7bbed3a14dc1c4a8f1204f0e0656037c1a8aa4f8323d43a0501f0"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.21/Docktor-Beta-v0.0.21-macos-x64.zip"
    sha256 "eb0140e0a9a4d75b746df94ccc24c2a2e686a5ea705276133703976344185412"
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

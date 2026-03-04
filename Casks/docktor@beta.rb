cask "docktor@beta" do
  version "0.0.28"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.28/Docktor-Beta-v0.0.28-macos-arm64.zip"
    sha256 "7401d290df978dd71d046f558764ab8415c07d9ab0460b77d20ace7636653b91"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.28/Docktor-Beta-v0.0.28-macos-x64.zip"
    sha256 "4f02ef040f92222f3005637d806779b9d8a12c8e294c1dd33146d75ee6aa2609"
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

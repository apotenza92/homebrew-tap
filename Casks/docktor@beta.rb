cask "docktor@beta" do
  version "0.0.18"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.18/Docktor-Beta-v0.0.18-macos-arm64.zip"
    sha256 "e83d2850c08fc883dc5b4eb912274696f95e70231cbe0226f78cd41904b35567"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.18/Docktor-Beta-v0.0.18-macos-x64.zip"
    sha256 "16c18f5ed15d2da4a6bc25c45ba019bdf5ebc1799607e983a251e9b320b92350"
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

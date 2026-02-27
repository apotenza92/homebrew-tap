cask "docktor@beta" do
  version "0.0.17"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.17/Docktor-Beta-v0.0.17-macos-arm64.zip"
    sha256 "da64ba88a736bef7895b42a2c35f715bd277b83d63c4f9b7b74da2e7e0e55c00"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.17/Docktor-Beta-v0.0.17-macos-x64.zip"
    sha256 "6f22188adcb6910d1ecce9106529af25c224f6c44754632e9a431eca45713174"
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

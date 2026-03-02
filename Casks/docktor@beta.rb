cask "docktor@beta" do
  version "0.0.24"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.24/Docktor-Beta-v0.0.24-macos-arm64.zip"
    sha256 "37541a4f5d6ab3b67bc62dbb6b881270b241f396b4a0d44f12a2d0fea0e460f0"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.24/Docktor-Beta-v0.0.24-macos-x64.zip"
    sha256 "f45784cdb33d785e94752d60f69e2142a04a8b7ae70fc113bcabcef37e1243bb"
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

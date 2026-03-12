cask "docktor@beta" do
  version "0.2.1"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.2.1/Docktor-Beta-v0.2.1-macos-arm64.zip"
    sha256 "e63fd8ae49c5e0642e2812394cd2304aac21b329b8bb7a971306a3a55f068ad0"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.2.1/Docktor-Beta-v0.2.1-macos-x64.zip"
    sha256 "e09cc5d4207524664a4c400c422acc1e14d9798cdbaeb28ab83122a239e0717f"
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

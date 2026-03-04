cask "docktor@beta" do
  version "0.0.26"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.26/Docktor-Beta-v0.0.26-macos-arm64.zip"
    sha256 "a583ead80a28fda1d22d377d15cfbc14cebb418667d1955483f83c8d66cbb07f"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.26/Docktor-Beta-v0.0.26-macos-x64.zip"
    sha256 "ca1744aaf2e33f07695603ac843c95c87cb2c5213d3045d649208e5b5fa11e81"
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

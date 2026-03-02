cask "docktor@beta" do
  version "0.0.24-beta.1"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.24-beta.1/Docktor-Beta-v0.0.24-beta.1-macos-arm64.zip"
    sha256 "aadaac43e8427608fe37c6e0c6d0aef2e093d9eeb8bd0bde894504e6802fd83d"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.24-beta.1/Docktor-Beta-v0.0.24-beta.1-macos-x64.zip"
    sha256 "2fb26a8827b6d251d6458812c68d3054538201cb2b695c24a1f003b548cb6655"
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

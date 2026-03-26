cask "dockmint@beta" do
  version "0.2.9"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.9/Dockmint-Beta-v0.2.9-macos-arm64.zip"
    sha256 "1c16036370126f663faf7c0b10ab6bef4fd9f08d682cdcf7958de49cc37ca92b"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.9/Dockmint-Beta-v0.2.9-macos-x64.zip"
    sha256 "dca94b0959bdb200ffa9c5e7200441a161999cd9e0ce0143cce0fb3f1ba726c2"
  end

  name "Dockmint Beta"
  desc "Beta channel for Dockmint"
  homepage "https://github.com/apotenza92/dockmint"

  livecheck do
    url "https://api.github.com/repos/apotenza92/dockmint/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Dockmint Beta.app"

  zap trash: [
    "~/Library/Application Support/Dockmint Beta",
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Caches/pzc.Dockmint.beta",
    "~/Library/Logs/Dockmint",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Preferences/pzc.Dockmint.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.beta.savedState",
    "~/Code/Dockmint/logs",
    "~/Code/Docktor/logs",
  ]
end

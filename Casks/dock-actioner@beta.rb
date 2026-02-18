cask "dock-actioner@beta" do
  version "0.0.6"
  sha256 :no_check

  on_arm do
    url "https://github.com/apotenza92/dock-actioner/releases/download/v#{version}/DockActioner-Beta-v#{version}-macos-arm64.zip"
  end

  on_intel do
    url "https://github.com/apotenza92/dock-actioner/releases/download/v#{version}/DockActioner-Beta-v#{version}-macos-x64.zip"
  end

  name "DockActioner Beta"
  desc "Beta channel for DockActioner"
  homepage "https://github.com/apotenza92/dock-actioner"

  livecheck do
    url "https://api.github.com/repos/apotenza92/dock-actioner/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "DockActioner Beta.app"

  zap trash: [
    "~/Library/Application Support/DockActioner Beta",
    "~/Library/Caches/pzc.DockActioner.beta",
    "~/Library/Preferences/pzc.DockActioner.beta.plist",
    "~/Library/Saved Application State/pzc.DockActioner.beta.savedState",
  ]
end

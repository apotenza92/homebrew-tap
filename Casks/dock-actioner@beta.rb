cask "dock-actioner@beta" do
  version "1.0.0"
  sha256 :no_check

  on_arm do
    url "https://github.com/apotenza92/dock-actioner/releases/download/v#{version}/DockActioner-v#{version}-macos-arm64.zip"
  end

  on_intel do
    url "https://github.com/apotenza92/dock-actioner/releases/download/v#{version}/DockActioner-v#{version}-macos-x64.zip"
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

  app "DockActioner.app"

  zap trash: [
    "~/Library/Application Support/DockActioner",
    "~/Library/Caches/pzc.DockActioner",
    "~/Library/Preferences/pzc.DockActioner.plist",
    "~/Library/Saved Application State/pzc.DockActioner.savedState",
  ]
end

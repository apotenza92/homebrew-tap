cask "dock-actioner" do
  version "0.0.8"
  sha256 :no_check

  on_arm do
    url "https://github.com/apotenza92/dock-actioner/releases/download/v#{version}/DockActioner-v#{version}-macos-arm64.zip"
  end

  on_intel do
    url "https://github.com/apotenza92/dock-actioner/releases/download/v#{version}/DockActioner-v#{version}-macos-x64.zip"
  end

  name "DockActioner"
  desc "Dock gesture actions for macOS"
  homepage "https://github.com/apotenza92/dock-actioner"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "DockActioner.app"

  zap trash: [
    "~/Library/Application Support/DockActioner",
    "~/Library/Caches/pzc.DockActioner",
    "~/Library/Preferences/pzc.DockActioner.plist",
    "~/Library/Saved Application State/pzc.DockActioner.savedState",
  ]
end

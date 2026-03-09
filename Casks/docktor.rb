cask "docktor" do
  version "0.0.35"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.35/Docktor-v0.0.35-macos-arm64.zip"
    sha256 "3330bf2b451ffa078449ef12f58057bf5088649a545eb8171bb51e9b21346483"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.35/Docktor-v0.0.35-macos-x64.zip"
    sha256 "448483ed16d3a17a295e4d2dc54f9f9bdeb617bf402913a0c1d0db8d3cb2f255"
  end

  name "Docktor"
  desc "Dock gesture actions for macOS"
  homepage "https://github.com/apotenza92/docktor"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Docktor.app"

  zap trash: [
    "~/Library/Application Support/Docktor",
    "~/Library/Caches/pzc.Dockter",
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
  ]
end

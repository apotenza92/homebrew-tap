cask "docktor" do
  version "0.0.24"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.24/Docktor-v0.0.24-macos-arm64.zip"
    sha256 "6c02a79d3ce09a29d3d108fd60252bedcb8040a16dbe7e36a528b9186a71ce7b"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.24/Docktor-v0.0.24-macos-x64.zip"
    sha256 "5e2e5a8d6316a34d843c49b8659188e38ec2f6b5dc8b3eccf9ff8734ef80bbc1"
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

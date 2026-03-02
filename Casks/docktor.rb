cask "docktor" do
  version "0.0.22"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.22/Docktor-v0.0.22-macos-arm64.zip"
    sha256 "fc9e7a66238a19b61cba4f89af3bc935baa1bbe2c34183d5f1c2e68cac3b69f6"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.22/Docktor-v0.0.22-macos-x64.zip"
    sha256 "eaf4857ed53413212f1236208b6be26d6d088f26f22b1cb00d250c8a6d1596b1"
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

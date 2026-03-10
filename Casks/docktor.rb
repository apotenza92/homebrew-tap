cask "docktor" do
  version "0.1.2"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.2/Docktor-v0.1.2-macos-arm64.zip"
    sha256 "4039d0173e552ec49cf2b81bcf77869b09572342277d2dbe2f82a6f98370f6e1"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.2/Docktor-v0.1.2-macos-x64.zip"
    sha256 "960d8bd1d90e42ffea7218f6fbfef52b1954dddd7f92a03b1075d1b46dffcff0"
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

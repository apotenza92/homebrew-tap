cask "docktor" do
  version "0.0.25"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.25/Docktor-v0.0.25-macos-arm64.zip"
    sha256 "c0031c6b1df09d0490fd8aee917c996d62b39a5452b34da4c504ad131e189d6a"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.25/Docktor-v0.0.25-macos-x64.zip"
    sha256 "55c9c8cc6c3ef236a1b4745bbe2033fd1ebca712c692a01137a6a019090716fc"
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

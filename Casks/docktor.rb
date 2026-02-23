cask "docktor" do
  version "0.0.10"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.10/Docktor-v0.0.10-macos-arm64.zip"
    sha256 "a2cedcc470fe5c6c1d73708a10e0e7510bf27aa1ec9052b064f40f6f06181f0f"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.10/Docktor-v0.0.10-macos-x64.zip"
    sha256 "6c9b7c9874bb8267584e5325e24e8f968bbd4bef9deaf5a07141b7262dd48f73"
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

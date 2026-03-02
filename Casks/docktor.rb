cask "docktor" do
  version "0.0.23"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.23/Docktor-v0.0.23-macos-arm64.zip"
    sha256 "b2fed993b82a8891ae6da6769f05f04e1174802aa90c0addad7fac90e9d1b703"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.23/Docktor-v0.0.23-macos-x64.zip"
    sha256 "04ac9cfe34fd3cfaf7923d5ebbe2616fcfada10448d477ca1f6f7211e497c46f"
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

cask "docktor" do
  version "0.0.14"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.14/Docktor-v0.0.14-macos-arm64.zip"
    sha256 "ed77c882f0d4bd1feb1d8ea974cd57bfc18909acc86a966053ee5a5acd43465b"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.14/Docktor-v0.0.14-macos-x64.zip"
    sha256 "15f186ebc88599b354284155a769427c421754912545c610d22b057289e859ec"
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

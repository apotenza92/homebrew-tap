cask "dockmint" do
  version "0.2.4"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.4/Dockmint-v0.2.4-macos-arm64.zip"
    sha256 "c77f401f0361e34ae8c475272ad09042cc4805087e63de1a5836ee322a213aeb"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.4/Dockmint-v0.2.4-macos-x64.zip"
    sha256 "c666ab66d8baab29efc84dcfccda5918dc11aab58c7f00479cab0bbed61814e0"
  end

  name "Dockmint"
  desc "Dock gesture actions for macOS"
  homepage "https://github.com/apotenza92/dockmint"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Dockmint.app"

  zap trash: [
    "~/Library/Application Support/Dockmint",
    "~/Library/Application Support/Docktor",
    "~/Library/Caches/pzc.Dockter",
    "~/Library/Caches/pzc.Dockmint",
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Preferences/pzc.Dockmint.plist",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.savedState",
  ]
end

cask "dockmint" do
  version "0.2.9"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.9/Dockmint-v0.2.9-macos-arm64.zip"
    sha256 "4fcacfb174c3a0effdb26dd1ee88d39579c8afe4d02ddc5170416df642b2437c"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.9/Dockmint-v0.2.9-macos-x64.zip"
    sha256 "50048bb553be8593cb0a0d1aa6d283397d73c4cf6956e7d365c64e37e0788dda"
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
    "~/Library/Logs/Dockmint",
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Preferences/pzc.Dockmint.plist",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.savedState",
    "~/Code/Dockmint/logs",
    "~/Code/Docktor/logs",
  ]
end

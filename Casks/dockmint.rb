cask "dockmint" do
  version "0.4.1"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.1/Dockmint-v0.4.1-macos-arm64.zip"
    sha256 "d19ef80f480a6d553d6670c65fec22c2e54dd7f0b48031c9bd32520edca903e1"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.1/Dockmint-v0.4.1-macos-x64.zip"
    sha256 "334cac0a034d957eec09840762103e8d51ea9b8c0eb62555bb5af5129b2ebea5"
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

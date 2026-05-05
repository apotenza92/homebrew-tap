cask "dockmint" do
  version "0.3.3"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.3/Dockmint-v0.3.3-macos-arm64.zip"
    sha256 "a271c0146b7f3b329d09b45a5f71820af22924b6443eaa97075802128c72cad7"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.3/Dockmint-v0.3.3-macos-x64.zip"
    sha256 "dd3439f5e576b951f2227561aae9cb6b3b8de44d020d9a02d02d0d72b4f5d6d5"
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

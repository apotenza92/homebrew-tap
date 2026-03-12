cask "docktor" do
  version "0.2.2"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2/Dockmint-v0.2.2-macos-arm64.zip"
    sha256 "707e37e7117e3907fb0d371fb78b9f474c2c837e2f4de7d5896d8380e0d7b537"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2/Dockmint-v0.2.2-macos-x64.zip"
    sha256 "90697c5b11c7a849bb3289ff92c99da919e7fabf534af0e0c709983784b01a3e"
  end

  name "Dockmint"
  desc "Legacy alias for Dockmint"
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

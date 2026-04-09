cask "dockmint@beta" do
  version "0.3.2"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.2/Dockmint-Beta-v0.3.2-macos-arm64.zip"
    sha256 "3c3c84bde14ad9d529156e25502bcaa37ec6403967ecdd5358a7ca1501aee524"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.2/Dockmint-Beta-v0.3.2-macos-x64.zip"
    sha256 "96093fdb172e7ec093eb5e3830dddf562a0b3c4b8e8daa7638432b11179a43a3"
  end

  name "Dockmint Beta"
  desc "Beta channel for Dockmint"
  homepage "https://github.com/apotenza92/dockmint"

  livecheck do
    url "https://api.github.com/repos/apotenza92/dockmint/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Dockmint Beta.app"

  zap trash: [
    "~/Library/Application Support/Dockmint Beta",
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Caches/pzc.Dockmint.beta",
    "~/Library/Logs/Dockmint",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Preferences/pzc.Dockmint.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.beta.savedState",
    "~/Code/Dockmint/logs",
    "~/Code/Docktor/logs",
  ]
end

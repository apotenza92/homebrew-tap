cask "dockmint@beta" do
  version "0.4.1"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.1/Dockmint-Beta-v0.4.1-macos-arm64.zip"
    sha256 "90c1db7b89e81a246bcbbf563a81264a8c2458c556ce514618dd9948b3722331"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.1/Dockmint-Beta-v0.4.1-macos-x64.zip"
    sha256 "7af4e3c15a20a6269dddcd97a04aa440229ed33563f5ba44a641a03115ae71f0"
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

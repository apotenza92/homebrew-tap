cask "dockmint@beta" do
  version "0.4.1"

  on_arm do
    sha256 "90c1db7b89e81a246bcbbf563a81264a8c2458c556ce514618dd9948b3722331"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "7af4e3c15a20a6269dddcd97a04aa440229ed33563f5ba44a641a03115ae71f0"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-Beta-v#{version}-macos-x64.zip"
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

  depends_on macos: :sonoma

  app "Dockmint Beta.app"

  zap trash: [
    "~/Code/Dockmint/logs",
    "~/Code/Docktor/logs",
    "~/Library/Application Support/Dockmint Beta",
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockmint.beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Logs/Dockmint",
    "~/Library/Preferences/pzc.Dockmint.beta.plist",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Saved Application State/pzc.Dockmint.beta.savedState",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
  ]
end

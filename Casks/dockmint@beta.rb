cask "dockmint@beta" do
  version "0.2.8"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.8/Dockmint-Beta-v0.2.8-macos-arm64.zip"
    sha256 "584f20c66829f8df938ef33db64b9c4fc65fedd3746737627af2f6f31125861a"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.8/Dockmint-Beta-v0.2.8-macos-x64.zip"
    sha256 "d5855057e37d3ec3dffe1bf11404c0ab191e8309b521e240a93d4c08fb15ee3c"
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

cask "dockmint@beta" do
  version "0.2.2-beta.2"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2-beta.2/Dockmint-Beta-v0.2.2-beta.2-macos-arm64.zip"
    sha256 "86bb72ef689ac74383741f3451f3291c4a0296771ac566f287939f5b247e8d30"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2-beta.2/Dockmint-Beta-v0.2.2-beta.2-macos-x64.zip"
    sha256 "623ea7a2f34379789780b65aba3c1d91245377814899ef7577104455b05e927a"
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
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Preferences/pzc.Dockmint.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.beta.savedState",
  ]
end

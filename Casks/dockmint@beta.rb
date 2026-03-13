cask "dockmint@beta" do
  version "0.2.5"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.5/Dockmint-Beta-v0.2.5-macos-arm64.zip"
    sha256 "218508c91b3d44358811972e7bad452a87ce0e7fb283f1a0c719c8ec263c78fd"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.5/Dockmint-Beta-v0.2.5-macos-x64.zip"
    sha256 "0ee9567e2372ab2e83624eb2a115c32d6d97cc8e5b7d076f1a6e7cdcbb80a119"
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

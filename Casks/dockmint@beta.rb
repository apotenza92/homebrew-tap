cask "dockmint@beta" do
  version "0.3.0"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.0/Dockmint-Beta-v0.3.0-macos-arm64.zip"
    sha256 "e3a3d84c78f66fb65c3be94500ddc9336d3300e80d14f56e5c63e65222e783d2"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.0/Dockmint-Beta-v0.3.0-macos-x64.zip"
    sha256 "b9a9a456259e141e0d7d841909eb714601714d614eae5e2c400b5c2ea16f73a5"
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

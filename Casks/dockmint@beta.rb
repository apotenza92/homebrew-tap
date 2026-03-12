cask "dockmint@beta" do
  version "0.2.3"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-Beta-v0.2.3-macos-arm64.zip"
    sha256 "3d8307c88ccc28014015155e5e0562d7a1b0c332beb3b6a7007d6deb48edbd4b"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-Beta-v0.2.3-macos-x64.zip"
    sha256 "3697872c931a4e1aea4ab46cf7790fee5851ea5821077676d947ad7fac794210"
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

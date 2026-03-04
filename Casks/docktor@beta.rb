cask "docktor@beta" do
  version "0.0.31"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.31/Docktor-Beta-v0.0.31-macos-arm64.zip"
    sha256 "2abe96bb88fc82a76e3e13c815b2c2f9717433d356c7be7f53c70fe80c59db6a"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.31/Docktor-Beta-v0.0.31-macos-x64.zip"
    sha256 "bbcfa9a4e4a1465c3227b03bcf7debb9b9b294f1eb78680b47c0554ccf0dbd05"
  end

  name "Docktor Beta"
  desc "Beta channel for Docktor"
  homepage "https://github.com/apotenza92/docktor"

  livecheck do
    url "https://api.github.com/repos/apotenza92/docktor/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Docktor Beta.app"

  zap trash: [
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
  ]
end

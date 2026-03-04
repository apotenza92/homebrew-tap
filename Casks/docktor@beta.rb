cask "docktor@beta" do
  version "0.0.30"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.30/Docktor-Beta-v0.0.30-macos-arm64.zip"
    sha256 "5fed33e08539849f00acab52ab8ef10024caf091dca57a601c761389dc4e0ec0"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.30/Docktor-Beta-v0.0.30-macos-x64.zip"
    sha256 "a04f5e98b61da5eb50d5d4cece4300b9fe3d9644e6bac36e8319c3a2d8bb838c"
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

cask "docktor@beta" do
  version "0.0.36"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.36/Docktor-Beta-v0.0.36-macos-arm64.zip"
    sha256 "4597b227609344bb53ad9bab6336bbecb75824388670e8dbebb2bc12bfd648bb"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.36/Docktor-Beta-v0.0.36-macos-x64.zip"
    sha256 "2c27711dc9bd301e3921e8608fb6c2093881bfdf51e0796d5d459712b562bf50"
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

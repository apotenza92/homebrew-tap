cask "docktor@beta" do
  version "0.0.38-beta.1"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.38-beta.1/Docktor-Beta-v0.0.38-beta.1-macos-arm64.zip"
    sha256 "3c9bb1b3c34e2c7a2999d0d35bfb9dcd2915d74cb6a2f4d9fcee8c140236a2c6"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.38-beta.1/Docktor-Beta-v0.0.38-beta.1-macos-x64.zip"
    sha256 "f513c8e6211926400981a33eab99e210cb98b889c07604c6d5d634e3a2c1ec2a"
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

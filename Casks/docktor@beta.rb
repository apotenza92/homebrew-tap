cask "docktor@beta" do
  version "0.0.38"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.38/Docktor-Beta-v0.0.38-macos-arm64.zip"
    sha256 "940d2c4135592721ca211278f0c8058475309cde7eb9a9f2a6614e400e534ebb"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.38/Docktor-Beta-v0.0.38-macos-x64.zip"
    sha256 "cbe64f6eb80e3f2a5ac572518c01ffff284b70cc0854abe38912c87e1969b900"
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

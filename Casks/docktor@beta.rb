cask "docktor@beta" do
  version "0.0.23"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.23/Docktor-Beta-v0.0.23-macos-arm64.zip"
    sha256 "55b45fb3ca62938343b74daf5ed01534018648b3f8f31764e2c35e5ecf9c9e80"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.23/Docktor-Beta-v0.0.23-macos-x64.zip"
    sha256 "376ab6f0062522b6dedf5488ef48168a04c82c4bd9db1d37036c408837cdb263"
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

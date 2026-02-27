cask "docktor@beta" do
  version "0.0.14"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.14/Docktor-Beta-v0.0.14-macos-arm64.zip"
    sha256 "f002710ec1d64567c36a33c2068df2d0d32c02576040a396d36ada518cbdc3e6"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.14/Docktor-Beta-v0.0.14-macos-x64.zip"
    sha256 "c11a7c15a1fbbeed5c95439b3079ccc11b51c1da0751cd6f2c662f9af1d33d04"
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

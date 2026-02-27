cask "docktor@beta" do
  version "0.0.20"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.20/Docktor-Beta-v0.0.20-macos-arm64.zip"
    sha256 "b4e99ae6a816b4aadba1bc3c89fbb97c8f1128fe887032a46bdce22df450c8d4"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.20/Docktor-Beta-v0.0.20-macos-x64.zip"
    sha256 "f48a61f470c957732c40183ef9886eebcc61a9cd5854128061e62b0ee1a83294"
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

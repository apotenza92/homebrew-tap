cask "docktor@beta" do
  version "0.0.13"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.13/Docktor-Beta-v0.0.13-macos-arm64.zip"
    sha256 "0b8dddcd97c560480e3813774102b78cd971ceeaf43aea0bb658881cc44c133c"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.13/Docktor-Beta-v0.0.13-macos-x64.zip"
    sha256 "3ac165bc1629f16652738cc080f7b675d611b598c875fee903ceb875bb789b2b"
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

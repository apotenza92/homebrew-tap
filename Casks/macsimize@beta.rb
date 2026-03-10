cask "macsimize@beta" do
  version "0.2.12"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.12/Macsimize-Beta-v0.2.12-macos-arm64.zip"
    sha256 "ce4aa6792c434e8277f4da378b2160607675a09b32c7d43fd1b57b8e5a94ceb9"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.12/Macsimize-Beta-v0.2.12-macos-x64.zip"
    sha256 "003b171958afbe17ff2bbd9c64888f35727c5633bb4a80f193ecab992d8782c9"
  end

  name "Macsimize Beta"
  desc "Beta channel for Macsimize"
  homepage "https://github.com/apotenza92/macsimize"

  livecheck do
    url "https://api.github.com/repos/apotenza92/macsimize/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Macsimize Beta.app"

  zap trash: [
    "~/Library/Application Support/Macsimize Beta",
    "~/Library/Caches/pzc.Macsimize.beta",
    "~/Library/Preferences/pzc.Macsimize.beta.plist",
    "~/Library/Saved Application State/pzc.Macsimize.beta.savedState",
  ]
end

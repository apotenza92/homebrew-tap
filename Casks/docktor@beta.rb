cask "docktor@beta" do
  version "0.1.1"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.1/Docktor-Beta-v0.1.1-macos-arm64.zip"
    sha256 "d302a58e811dbf6280db0248f22e45b102f8d49c0fbbc9dc5555f0154556d879"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.1.1/Docktor-Beta-v0.1.1-macos-x64.zip"
    sha256 "fbc86e5a1bfeccc38c3e02088cdcc0b5b2df54ca52bdf0fdab83009ccbeff811"
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

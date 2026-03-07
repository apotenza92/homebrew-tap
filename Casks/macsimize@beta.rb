cask "macsimize@beta" do
  version "0.2.3"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.3/Macsimize-Beta-v0.2.3-macos-arm64.zip"
    sha256 "47a550b76f3dd6854f7c25dad6c4c8c3f18abaf89a1038d4784fc7f83dbcdf39"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.3/Macsimize-Beta-v0.2.3-macos-x64.zip"
    sha256 "1624568aa221d29e88f9b7e55c5da875ac077f495b9327aa68adba64544e242b"
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

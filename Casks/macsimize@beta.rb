cask "macsimize@beta" do
  version "0.2.13"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.13/Macsimize-Beta-v0.2.13-macos-arm64.zip"
    sha256 "609b908747ec21a7f4c13ff0891c4fbb9ef9c2143252e0c7b5fa7528bf8c08ae"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.13/Macsimize-Beta-v0.2.13-macos-x64.zip"
    sha256 "0e6d8d80a8d4222d860b52c10c263f2715480a3b43396f1b9eea79554a89f606"
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

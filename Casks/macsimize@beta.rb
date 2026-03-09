cask "macsimize@beta" do
  version "0.2.8"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.8/Macsimize-Beta-v0.2.8-macos-arm64.zip"
    sha256 "caa7de2d949da7ea07598faca8ae1bdded1e6192e2ed4a7cf4a680874305cc0c"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.8/Macsimize-Beta-v0.2.8-macos-x64.zip"
    sha256 "c651b1155d3ab34a48149ab00e0066452328d0d131ce94f6808992e30523ab9e"
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

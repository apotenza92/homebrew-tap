cask "macsimize@beta" do
  version "0.3.0"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.0/Macsimize-Beta-v0.3.0-macos-arm64.zip"
    sha256 "bdb75fe8c76e0063bddec219e04f1c4e8a83d102956e0559e5a62246027a9cde"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.0/Macsimize-Beta-v0.3.0-macos-x64.zip"
    sha256 "71db6561d76e96e580468d3bf6953c6f2364a89dc4444a07f26a32ea93de78e8"
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

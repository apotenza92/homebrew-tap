cask "docktor@beta" do
  version "0.0.33"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.33/Docktor-Beta-v0.0.33-macos-arm64.zip"
    sha256 "944bf7255a57baa9d2252a808b6ac0c0bca5bd78edc441ff161a607aa8ecdaab"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.33/Docktor-Beta-v0.0.33-macos-x64.zip"
    sha256 "7f3cc1f29e8496910121718ef5464864454e9b57b5ab7f948544273421a4459f"
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

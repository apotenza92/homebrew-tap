cask "macsimize@beta" do
  version "0.2.9"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.9/Macsimize-Beta-v0.2.9-macos-arm64.zip"
    sha256 "ce50c9a086aaaa62043a6cb3aa53f8414388e5846b343b410ff1b952b2658015"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.9/Macsimize-Beta-v0.2.9-macos-x64.zip"
    sha256 "486584e602267a6800c04d6bb3406ca886e86ab1d77b737278f3a34387dbd663"
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

cask "macsimize@beta" do
  version "0.2.11"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.11/Macsimize-Beta-v0.2.11-macos-arm64.zip"
    sha256 "041d2bee2e7ec4d9fad0b934a72516138c25f551831a4da98a93e2e2343e44b5"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.11/Macsimize-Beta-v0.2.11-macos-x64.zip"
    sha256 "fa26bdd78bc872a441244823d3f8348bcba2114d11bfed396166628502cfa54f"
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

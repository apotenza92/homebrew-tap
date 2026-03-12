cask "macsimize@beta" do
  version "0.3.5"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.5/Macsimize-Beta-v0.3.5-macos-arm64.zip"
    sha256 "6e99160d9bbed5e00fa45802ab992c208f88f6861fde11cf4bcc61943ae9104d"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.3.5/Macsimize-Beta-v0.3.5-macos-x64.zip"
    sha256 "d57538222f23fa7949e5a5b969a0a95aa0a9006ab7290f696d73c5d182f9eadb"
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

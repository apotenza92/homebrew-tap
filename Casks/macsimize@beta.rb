cask "macsimize@beta" do
  version "0.2.10"

  on_arm do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.10/Macsimize-Beta-v0.2.10-macos-arm64.zip"
    sha256 "a177ff6050d58a610909423221a18752b33fe0f4791e5bb85f6d96d1d9add04a"
  end

  on_intel do
    url "https://github.com/apotenza92/macsimize/releases/download/v0.2.10/Macsimize-Beta-v0.2.10-macos-x64.zip"
    sha256 "305d33704d3fa3f289bbb4610cb82bddf963630bd1f56e15c303c6150c74afc0"
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

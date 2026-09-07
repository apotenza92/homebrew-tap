cask "macsimize@beta" do
  version "0.3.20"

  on_arm do
    sha256 "abc98128af56c27dc04758810852545a732e93061a3dbe036218509b4d9d0f66"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "d60dd5727f295ac2784d3529632a66c0537067b4b399a46df73833a5adaf8f8f"

    url "https://github.com/apotenza92/macsimize/releases/download/v#{version}/Macsimize-Beta-v#{version}-macos-x64.zip"
  end

  name "Macsimize Beta"
  desc "Beta channel for Macsimize"
  homepage "https://github.com/apotenza92/macsimize"

  livecheck do
    url "https://api.github.com/repos/apotenza92/macsimize/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"].delete_prefix("v") }
    end
  end

  depends_on macos: :sonoma

  app "Macsimize Beta.app"

  zap trash: [
    "~/Library/Application Support/Macsimize Beta",
    "~/Library/Caches/pzc.Macsimize.beta",
    "~/Library/Preferences/pzc.Macsimize.beta.plist",
    "~/Library/Saved Application State/pzc.Macsimize.beta.savedState",
  ]
end

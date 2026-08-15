cask "fraia@beta" do
  version "0.0.15"

  on_arm do
    sha256 "159c9a8f1397dd56aef0208887c553609f64d39cca032b5334886b667eeb15cd"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "7c4c1e9d1900a42c766272aee58a487d4639e899cecf9fd8e7714436ddfad0c9"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-Beta-macOS-x64.zip"
  end

  name "Fraia Beta"
  desc "Beta channel for Fraia structural engineering design and analysis"
  homepage "https://github.com/apotenza92/fraia"

  livecheck do
    skip "Updated by trusted Fraia release automation"
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Fraia Beta.app"

  zap trash: [
    "~/Library/Application Support/Fraia Beta",
    "~/Library/Caches/app.fraia.desktop.beta",
    "~/Library/Caches/app.fraia.desktop.beta.ShipIt",
    "~/Library/Preferences/app.fraia.desktop.beta.plist",
    "~/Library/Saved Application State/app.fraia.desktop.beta.savedState",
  ]
end

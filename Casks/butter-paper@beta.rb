cask "butter-paper@beta" do
  version "0.0.22"

  on_arm do
    sha256 "b734ddf878e04233cf0c476ac54526988d26544afc3f77e250b7b116f1a21d18"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "0e4bd23c33ce07de09162b2be400dbf8ef40d85db282363d6266ddd1ae03e88e"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-x64.zip"
  end

  name "Butter Paper Beta"
  desc "Cross-platform PDF review and markup (beta channel)"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release workflow"
  end

  auto_updates true
  depends_on macos: :monterey

  app "Butter Paper Beta.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper Beta",
    "~/Library/Caches/com.butterpaper.desktop.beta",
    "~/Library/Caches/com.butterpaper.desktop.beta.ShipIt",
    "~/Library/Preferences/com.butterpaper.desktop.beta.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.beta.savedState",
  ]
end

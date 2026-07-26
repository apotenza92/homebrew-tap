cask "butter-paper" do
  version "0.0.6"

  on_arm do
    sha256 "8bd1830316ef245f5fda813b71b73c4b4d8c8839cb730525f6ae28ce821075b9"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "15544b63e87975a45353bf0bda448e171ffd68f49d451a3a932c128d0d4574a8"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-x64.zip"
  end

  name "Butter Paper"
  desc "Cross-platform PDF review and markup"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release workflow"
  end

  auto_updates true
  depends_on macos: :monterey

  app "Butter Paper.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper",
    "~/Library/Caches/com.butterpaper.desktop",
    "~/Library/Caches/com.butterpaper.desktop.ShipIt",
    "~/Library/Preferences/com.butterpaper.desktop.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.savedState",
  ]
end

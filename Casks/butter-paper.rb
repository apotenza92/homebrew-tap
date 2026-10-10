cask "butter-paper" do
  version "0.1.4"

  on_arm do
    sha256 "49116bc528b1b3afaf610252b6a3c23a48828d5a603496b2b17488ed6adc6cb5"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "2e04df0a3e2618fa289ef51811a3c0e3bb12696959a8260a727631ba97100255"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-x64.zip"
  end

  name "Butter Paper"
  desc "Cross-platform PDF review and markup"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release workflow"
  end

  auto_updates true
  depends_on macos: :ventura

  app "Butter Paper.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper",
    "~/Library/Application Support/com.butterpaper.desktop",
    "~/Library/Caches/com.butterpaper.desktop",
    "~/Library/Preferences/com.butterpaper.desktop.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.savedState",
  ]
end

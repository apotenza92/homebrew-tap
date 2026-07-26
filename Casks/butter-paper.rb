cask "butter-paper" do
  version "0.0.3"

  on_arm do
    sha256 "19c84309e9f2186fb2d26a4310512760e66d1cd3fda4103dc326a96f38530abe"

    url "https://github.com/apotenza92/butter-paper/releases/download/v0.0.3/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "3288a7d612e968df9c6f99f920e10b1fc9143b7b92e48ef04442586ad9f5d8a8"

    url "https://github.com/apotenza92/butter-paper/releases/download/v0.0.3/Butter-Paper-macOS-x64.zip"
  end

  name "Butter Paper"
  desc "Cross-platform PDF review and markup"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release workflow"
  end

  auto_updates true
  depends_on :macos

  app "Butter Paper.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper",
    "~/Library/Caches/com.butterpaper.desktop",
    "~/Library/Caches/com.butterpaper.desktop.ShipIt",
    "~/Library/Preferences/com.butterpaper.desktop.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.savedState",
  ]
end

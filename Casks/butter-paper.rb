cask "butter-paper" do
  version "0.0.21"

  on_arm do
    sha256 "6373889383284f37ea67a726df3b89aedaeed362b8d27ac900ca7bb090289c46"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "762b78bdf74a6fb14381739f463de42a1dfb82f9d19886132721e95f511dc1ac"

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

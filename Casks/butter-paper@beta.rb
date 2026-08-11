cask "butter-paper@beta" do
  version "0.0.20"

  on_arm do
    sha256 "2fc4428971aa00f80027693e9ac3f9df903584ea0862126a929b7e4e2fead6ab"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "79688b4dcd49176a8463a14431caaa1c1faa63653f15ef6886351b9f7d1bfd43"

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

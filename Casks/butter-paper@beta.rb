cask "butter-paper@beta" do
  version "0.3.0"

  on_arm do
    sha256 "f2ce89e81507e82bb00185dc713b7fbdc97b8393bd4e7c668b4fd73897d2d1a8"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "d4eb6ecda9d2e1c1772e15539f88eace25e1f009f86d8f22d14449b382022b85"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-x64.zip"
  end

  name "Butter Paper Beta"
  desc "Cross-platform PDF review and markup (beta channel)"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release workflow"
  end

  auto_updates true
  depends_on macos: :ventura

  app "Butter Paper Beta.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper Beta",
    "~/Library/Application Support/com.butterpaper.desktop.beta",
    "~/Library/Caches/com.butterpaper.desktop.beta",
    "~/Library/Preferences/com.butterpaper.desktop.beta.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.beta.savedState",
  ]
end

cask "butter-paper" do
  version "0.0.26"

  on_arm do
    sha256 "3fe0adfb5347a216c960972fbe23855c06d37a841d88a302cde536b2f8295d45"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "7fe1a530c141f32512707b45ee9579e6b20470c5992a60193bae5a6c7a891f3b"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-x64.zip"
  end

  name "Butter Paper"
  desc "Cross-platform PDF review and markup"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release process"
  end

  depends_on macos: ">= :ventura"

  app "Butter Paper.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper",
    "~/Library/Application Support/com.butterpaper.desktop",
    "~/Library/Caches/com.butterpaper.desktop",
    "~/Library/Caches/com.butterpaper.desktop.ShipIt",
    "~/Library/Preferences/com.butterpaper.desktop.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.savedState",
  ]
end

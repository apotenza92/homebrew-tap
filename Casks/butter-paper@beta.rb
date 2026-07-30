cask "butter-paper@beta" do
  version "0.0.13"

  on_arm do
    sha256 "20abee363b9f4815f9f4c7325f2f2b8418b255b4b65bc87feb187968ff9552ea"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "c818ce1a23aa28d2fc3e101cf1c52a99207e6a70cee5b28b5e72b9eea928cacd"

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

cask "butter-paper@beta" do
  version "0.0.18"

  on_arm do
    sha256 "796ae169096d945fb877993ef40fc34452afbede61395e26da6a887341b06ce4"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "acf7a3fdd7726c45f4e5e318319c22c26fe865d461eeb196c69c0bfdc407501a"

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

cask "butter-paper@beta" do
  version "0.5.4"

  on_arm do
    sha256 "79850f4c5ee1a19e9210df760f3aacfe7bd9eb4842af4c6cfdb915f8f963b61f"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "aee2c4d9d9050f8e50d2b95be9725fe3165fc069fea89acca9052eef83a9d428"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-x64.zip"
  end

  name "Butter Paper Beta"
  desc "PDF editing and markup (beta channel)"
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

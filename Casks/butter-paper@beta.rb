cask "butter-paper@beta" do
  version "0.6.1"

  on_arm do
    sha256 "e9cc376c639e7d2b0093d17443c7fba9aac61f7294dcb8d87f561c64854adcf4"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "d88e6b447c5c34bf5a65f83c634d177f12bc4be966cb2ce12f8fb633e7670953"

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

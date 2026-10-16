cask "butter-paper@beta" do
  version "0.2.0"

  on_arm do
    sha256 "ca4a4b65c4f077ea15fd8934c130af2fcefd835845b3d2b39b2aa32f1cd7bcc1"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "ba278c8cc178157c52e56f68e13476fa7b6746eb08bebe91926308bc45d89033"

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

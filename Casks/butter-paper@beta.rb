cask "butter-paper@beta" do
  version "0.0.3"

  on_arm do
    sha256 "04def6fc0c6b9cdb4da48846ae4e387efcd3177fbfe277545c40fea5585ed758"

    url "https://github.com/apotenza92/butter-paper/releases/download/v0.0.3/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "4a5cf8fec08ec08189916ec69f68f3019dc0084f7839be4e85b471d3bfc1c709"

    url "https://github.com/apotenza92/butter-paper/releases/download/v0.0.3/Butter-Paper-Beta-macOS-x64.zip"
  end

  name "Butter Paper Beta"
  desc "Cross-platform PDF review and markup (beta channel)"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release workflow"
  end

  auto_updates true
  depends_on :macos

  app "Butter Paper Beta.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper Beta",
    "~/Library/Caches/com.butterpaper.desktop.beta",
    "~/Library/Caches/com.butterpaper.desktop.beta.ShipIt",
    "~/Library/Preferences/com.butterpaper.desktop.beta.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.beta.savedState",
  ]
end

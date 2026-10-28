cask "butter-paper" do
  version "0.3.2"

  on_arm do
    sha256 "80b13bff34b195ac88437b361695f617b020e4c0d5c8f57519d2479d8e335afe"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "69259c7a703a0b7e2df7b01af3fc18ef753a0996f310e30ab40eb0918f11c0b3"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-x64.zip"
  end

  name "Butter Paper"
  desc "Cross-platform PDF review and markup"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release workflow"
  end

  auto_updates true
  depends_on macos: :ventura

  app "Butter Paper.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper",
    "~/Library/Application Support/com.butterpaper.desktop",
    "~/Library/Caches/com.butterpaper.desktop",
    "~/Library/Preferences/com.butterpaper.desktop.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.savedState",
  ]
end

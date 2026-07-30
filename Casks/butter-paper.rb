cask "butter-paper" do
  version "0.0.13"

  on_arm do
    sha256 "b568141ae83db1c218181fe5494ae2dc37b8a03d8726576af917bb71ea6bdc6e"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "00a408193c57fe9cb3a152ab66b6cc3c775c4d42a91617e9346273b11c635bdd"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-x64.zip"
  end

  name "Butter Paper"
  desc "Cross-platform PDF review and markup"
  homepage "https://github.com/apotenza92/butter-paper"

  livecheck do
    skip "Updated by the Butter Paper release workflow"
  end

  auto_updates true
  depends_on macos: :monterey

  app "Butter Paper.app"

  zap trash: [
    "~/Library/Application Support/Butter Paper",
    "~/Library/Caches/com.butterpaper.desktop",
    "~/Library/Caches/com.butterpaper.desktop.ShipIt",
    "~/Library/Preferences/com.butterpaper.desktop.plist",
    "~/Library/Saved Application State/com.butterpaper.desktop.savedState",
  ]
end

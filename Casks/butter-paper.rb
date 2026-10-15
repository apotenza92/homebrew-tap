cask "butter-paper" do
  version "0.1.10"

  on_arm do
    sha256 "a8d853b44b92c6f65aa453daec65d4557db35b72a1ce25e2f9856e3654279b91"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "846d00b6dc6de06143237028a3615521e72f49f224e11888a109e87122ff9772"

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

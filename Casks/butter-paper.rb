cask "butter-paper" do
  version "0.4.7"

  on_arm do
    sha256 "50cbfd5fc22374b69f3fb27fbc38f0c407fd1eb758be5c4e5e94f9247bbc32c5"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-arm64.zip"
  end
  on_intel do
    sha256 "605be15c1ee7b0e41c88a18c8f530e2a3b7f69f61964c16618f95d6fcf18901d"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-macOS-x64.zip"
  end

  name "Butter Paper"
  desc "PDF editing and markup"
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

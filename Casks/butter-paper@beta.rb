cask "butter-paper@beta" do
  version "0.1.1"

  on_arm do
    sha256 "9729a75daeae00a1c349392b4b14337f4e5143189ba3f3c939180219e2319ffa"

    url "https://github.com/apotenza92/butter-paper/releases/download/v#{version}/Butter-Paper-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "7023102a7b230c45400653dabe9f6c8a9a0076e4993307513399d8551a20d227"

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

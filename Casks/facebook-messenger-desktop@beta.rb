cask "facebook-messenger-desktop@beta" do
  version "1.4.2"

  on_arm do
    sha256 "824fe23dfc8a384766fbbdd0d28d5291a810a95b78b4fe773d98a5c650af50d8"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end
  on_intel do
    sha256 "82c6f9a28b80d1afe78cca0c82eaa7948fb21071949db400be92d0b183b71db8"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-x64.zip"
  end

  name "Messenger Beta"
  desc "Desktop client for Facebook Messenger (Beta)"
  homepage "https://github.com/apotenza92/facebook-messenger-desktop"

  livecheck do
    skip "Updated by the Messenger release workflow"
  end

  depends_on macos: :monterey

  app "Messenger Beta.app"

  zap trash: [
    "~/Library/Application Support/Messenger-Beta",
    "~/Library/Caches/com.facebook.messenger.desktop.beta",
    "~/Library/Caches/com.facebook.messenger.desktop.beta.ShipIt",
    "~/Library/Preferences/com.facebook.messenger.desktop.beta.plist",
    "~/Library/Saved Application State/com.facebook.messenger.desktop.beta.savedState",
  ]
end

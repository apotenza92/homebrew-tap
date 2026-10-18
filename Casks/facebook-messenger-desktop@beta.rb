cask "facebook-messenger-desktop@beta" do
  version "1.5.0-beta.2"

  on_arm do
    sha256 "2ac4f59ea9129cf0497d3ebe52020421b944c91c79e1c81ff727a140ca169a07"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end
  on_intel do
    sha256 "3ab19c9ce116f5e8b26237cb135aadb5d8a71b47daede88bce3c43c367ea89f2"

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

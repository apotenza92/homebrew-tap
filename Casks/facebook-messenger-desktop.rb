cask "facebook-messenger-desktop" do
  version "1.1.4"

  on_arm do
    sha256 "b810a96c51a12ee2381fd9bccf7142c656749dbb8166bc7c9f8aadac7f02087b"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-arm64.zip"
  end

  on_intel do
    sha256 "00c9918690956277d7a24afc9f40c59c82004bb9faf1fdbb7f34482d9b78e625"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-x64.zip"
  end

  name "Messenger"
  desc "Desktop client for Facebook Messenger"
  homepage "https://github.com/apotenza92/facebook-messenger-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Messenger.app"

  zap trash: [
    "~/Library/Application Support/facebook-messenger-desktop",
    "~/Library/Caches/com.facebook.messenger.desktop",
    "~/Library/Caches/com.facebook.messenger.desktop.ShipIt",
    "~/Library/Preferences/com.facebook.messenger.desktop.plist",
    "~/Library/Saved Application State/com.facebook.messenger.desktop.savedState",
  ]
end

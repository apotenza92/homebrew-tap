cask "facebook-messenger-desktop" do
  version "1.1.0"

  on_arm do
    sha256 "954dcdfe5bed335ce9d154607c7db97cd8efcc12964af905bc3cdd548d0e3dd1"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-arm64.zip"
  end

  on_intel do
    sha256 "a778edcd35a35723cf4b6f24885c8685819b0532c9bb16ef937fad0806d9aae3"
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

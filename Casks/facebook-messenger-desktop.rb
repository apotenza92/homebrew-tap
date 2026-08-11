cask "facebook-messenger-desktop" do
  version "1.4.2"

  on_arm do
    sha256 "c8e24a3adecb7c40a47b1185f6c39106c3a6ecd260d603182d73a965c650906d"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-arm64.zip"
  end
  on_intel do
    sha256 "0ae5b573fe6c01b147317042d1adafd118fb8215536dfcf2c05e55c467b2126f"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-x64.zip"
  end

  name "Messenger"
  desc "Desktop client for Facebook Messenger"
  homepage "https://github.com/apotenza92/facebook-messenger-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Messenger.app"

  zap trash: [
    "~/Library/Application Support/Messenger",
    "~/Library/Caches/com.facebook.messenger.desktop",
    "~/Library/Caches/com.facebook.messenger.desktop.ShipIt",
    "~/Library/Preferences/com.facebook.messenger.desktop.plist",
    "~/Library/Saved Application State/com.facebook.messenger.desktop.savedState",
  ]
end

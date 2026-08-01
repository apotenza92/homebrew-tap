cask "facebook-messenger-desktop" do
  version "1.4.0"

  on_arm do
    sha256 "1d1b985527aa523498b865e2fff12333a2c42143dc00d37fdcce95abcfd92cc7"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-arm64.zip"
  end
  on_intel do
    sha256 "d0d469e10863c6e53408ba387a2599c8cee8d849dc58f70817de8cfd0fa2400a"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-x64.zip"
  end

  name "Messenger"
  desc "Desktop client for Facebook Messenger"
  homepage "https://github.com/apotenza92/facebook-messenger-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Messenger.app"

  zap trash: [
    "~/Library/Application Support/Messenger",
    "~/Library/Caches/com.facebook.messenger.desktop",
    "~/Library/Caches/com.facebook.messenger.desktop.ShipIt",
    "~/Library/Preferences/com.facebook.messenger.desktop.plist",
    "~/Library/Saved Application State/com.facebook.messenger.desktop.savedState",
  ]
end

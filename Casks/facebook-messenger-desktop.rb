cask "facebook-messenger-desktop" do
  version "1.1.3"

  on_arm do
    sha256 "b96e50f762b7505e9de21a932fd8e9ca604843f6a3c477527eb639b90da094b3"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-arm64.zip"
  end

  on_intel do
    sha256 "09d49c33e028f41900d3ff47bd32b79f8c49ccd9ae8e29dfd53713a7d1d4a773"
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

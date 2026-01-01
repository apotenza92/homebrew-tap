cask "facebook-messenger-desktop" do
  version "0.1.9"

  on_arm do
    sha256 "e7dfca928f6ea16580797d0880908e205a531a75fe2902e23ac73923a94dd84d"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "71894cc106eec5a0648a44d32b80877a9604108b0f0d8a5ea2c8e027c0234703"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-#{version}-macos-x64.zip"
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


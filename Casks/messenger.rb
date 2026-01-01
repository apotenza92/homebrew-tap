cask "messenger" do
  version "0.1.9"

  on_arm do
    sha256 "REPLACE_WITH_ARM64_SHA256"
    url "https://github.com/apotenza92/FacebookMessengerDesktop/releases/download/v#{version}/Messenger-#{version}-macos-arm64.zip"
  end

  on_intel do
    sha256 "REPLACE_WITH_X64_SHA256"
    url "https://github.com/apotenza92/FacebookMessengerDesktop/releases/download/v#{version}/Messenger-#{version}-macos-x64.zip"
  end

  name "Messenger"
  desc "Desktop client for Facebook Messenger"
  homepage "https://github.com/apotenza92/FacebookMessengerDesktop"

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


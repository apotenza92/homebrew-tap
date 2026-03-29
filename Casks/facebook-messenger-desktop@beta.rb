cask "facebook-messenger-desktop@beta" do
  version "1.3.0-beta.35"

  on_arm do
    sha256 "5368f6641e3bd5d9b3a3c8805813c3c14d598eca64e9e2c3cee35ed4ff48c3b2"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end

  on_intel do
    sha256 "386ac101224657b49955725d1931af53859f563a35c8b191d335f04316b1783a"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-x64.zip"
  end

  name "Messenger Beta"
  desc "Desktop client for Facebook Messenger (Beta)"
  homepage "https://github.com/apotenza92/facebook-messenger-desktop"

  livecheck do
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases"
    regex(/v?(\d+(?:\.\d+)*-(?:alpha|beta|rc)[\w.]*)/i)
    strategy :page_match
  end

  app "Messenger Beta.app"

  zap trash: [
    "~/Library/Application Support/Messenger-Beta",
    "~/Library/Caches/com.facebook.messenger.desktop.beta",
    "~/Library/Caches/com.facebook.messenger.desktop.beta.ShipIt",
    "~/Library/Preferences/com.facebook.messenger.desktop.beta.plist",
    "~/Library/Saved Application State/com.facebook.messenger.desktop.beta.savedState",
  ]
end

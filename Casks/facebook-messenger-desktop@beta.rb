cask "facebook-messenger-desktop@beta" do
  version "1.2.4"

  on_arm do
    sha256 "dc0d53036f000017ff21b6c7bc0dc83038361b3c4c3d88c26a7dd9393bdca97d"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end

  on_intel do
    sha256 "1929512ea68cf7180def3c0d52cd185cc2a5a9a8701617600f3b19b0d484e549"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-x64.zip"
  end

  name "Messenger Beta"
  desc "Desktop client for Facebook Messenger (Beta)"
  homepage "https://github.com/apotenza92/facebook-messenger-desktop"

  livecheck do
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases"
    regex(/v?(\d+(?:\.\d+)*(?:-(?:alpha|beta|rc)[\w.]*)?)/i)
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

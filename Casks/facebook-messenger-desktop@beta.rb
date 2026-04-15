cask "facebook-messenger-desktop@beta" do
  version "1.3.1-beta.5"

  on_arm do
    sha256 "fadd9bd3b28eaa1186df4588613d1313b9947372f32e32d8968cae04d06ab28f"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end

  on_intel do
    sha256 "75237f1e3055122703ea145e7fc63bc62f0138d7220d597b24f7a2e9fcc494ab"
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

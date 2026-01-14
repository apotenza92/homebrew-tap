cask "facebook-messenger-desktop@beta" do
  version "1.2.1-beta.2"

  on_arm do
    sha256 :no_check
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-arm64.zip"
  end

  on_intel do
    sha256 :no_check
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-x64.zip"
  end

  name "Messenger (Beta)"
  desc "Desktop client for Facebook Messenger - Beta channel with early access to new features"
  homepage "https://github.com/apotenza92/facebook-messenger-desktop"

  livecheck do
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases?q=prerelease%3Atrue"
    regex(/href=.*?tag\/v?(\d+(?:\.\d+)*-(?:alpha|beta|rc)[.\d]*)/i)
    strategy :page_match
  end

  conflicts_with cask: "apotenza92/tap/facebook-messenger-desktop"

  app "Messenger.app"

  zap trash: [
    "~/Library/Application Support/Messenger",
    "~/Library/Caches/com.facebook.messenger.desktop",
    "~/Library/Caches/com.facebook.messenger.desktop.ShipIt",
    "~/Library/Preferences/com.facebook.messenger.desktop.plist",
    "~/Library/Saved Application State/com.facebook.messenger.desktop.savedState",
  ]
end

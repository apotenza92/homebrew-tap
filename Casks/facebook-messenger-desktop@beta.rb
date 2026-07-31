cask "facebook-messenger-desktop@beta" do
  version "1.3.1-beta.45"

  on_arm do
    sha256 "29c2d32fa5ecaa78270fdfa507e0240df827703e98ef4c5d87fada234b99913d"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end
  on_intel do
    sha256 "fe8163a1748c844be5504109d701b22cd2a403978106b17d0160cdd0b407aeaa"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-x64.zip"
  end

  name "Messenger Beta"
  desc "Desktop client for Facebook Messenger (Beta)"
  homepage "https://github.com/apotenza92/facebook-messenger-desktop"

  livecheck do
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases"
    regex(/v?(\d+\.\d+\.\d+-beta\.[1-9]\d*)/i)
    strategy :page_match
  end

  depends_on :macos

  app "Messenger Beta.app"

  zap trash: [
    "~/Library/Application Support/Messenger-Beta",
    "~/Library/Caches/com.facebook.messenger.desktop.beta",
    "~/Library/Caches/com.facebook.messenger.desktop.beta.ShipIt",
    "~/Library/Preferences/com.facebook.messenger.desktop.beta.plist",
    "~/Library/Saved Application State/com.facebook.messenger.desktop.beta.savedState",
  ]
end

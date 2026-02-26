cask "facebook-messenger-desktop@beta" do
  version "1.3.0-beta.11"

  on_arm do
    sha256 "b7ce6aecdf1d81be5f395965ec3498a7bcf87f44add7f54e6411c71c724d5559"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end

  on_intel do
    sha256 "02c1b09d473c271e56c7c13d122b479c79b5c71037da8c0e54d15d0598085ce3"
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

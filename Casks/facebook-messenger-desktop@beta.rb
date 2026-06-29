cask "facebook-messenger-desktop@beta" do
  version "1.3.1-beta.30"

  on_arm do
    sha256 "6ecb0d31fb0bc5ac5418c2fe49b71ea4c2eeb61db486ada39d76007dcf96f513"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end

  on_intel do
    sha256 "0be5f2f6b2a2a3cd5b5a3e09022c39d78c5a358171ada7187c1c144d468e4973"
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

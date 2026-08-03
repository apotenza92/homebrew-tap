cask "facebook-messenger-desktop@beta" do
  version "1.4.1-beta.1"

  on_arm do
    sha256 "10d68d72c8cdfb765a63c6e2bd52b914e3cc3831c99c83b841930d34cc6e4dd5"

    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-Beta-macos-arm64.zip"
  end
  on_intel do
    sha256 "fc9f3abfc01d2c7ba6dfeaefe8f379be0f4704faf06050a3acd3fc8e97d6936a"

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

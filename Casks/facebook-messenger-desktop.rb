cask "facebook-messenger-desktop" do
  version "1.0.10"

  on_arm do
    sha256 "57fe4e02a65c482624a6ee797c6a0c8d166c662793cd89a1e8d74d3a453ac386"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-arm64.zip"
  end

  on_intel do
    sha256 "73b98533410086f1bb492601ecc63ff941da565db4842203f265a0cb0d8e5367"
    url "https://github.com/apotenza92/facebook-messenger-desktop/releases/download/v#{version}/Messenger-macos-x64.zip"
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

cask "simple-mac-fixes" do
  version "0.0.7"

  on_arm do
    sha256 "563fc77e37b496a6032fb730ed4e8225d7a7a54b646b8f725e3a13ac8c64ca0f"

    url "https://github.com/apotenza92/simple-mac-fixes/releases/download/v#{version}/Simple-Mac-Fixes-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "36ca8948d305edcc480d78b63d5e7aa3e024b33cd26eef3d833794c8c3a186c2"

    url "https://github.com/apotenza92/simple-mac-fixes/releases/download/v#{version}/Simple-Mac-Fixes-v#{version}-macos-x64.zip"
  end

  name "Simple Mac Fixes"
  desc "Fixes for behaviours that annoy people coming from Windows"
  homepage "https://apotenza92.github.io/simple-mac-fixes/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Simple Mac Fixes.app"

  zap trash: [
    "~/Library/Caches/com.apotenza.SimpleMacFixes",
    "~/Library/HTTPStorages/com.apotenza.SimpleMacFixes",
    "~/Library/Preferences/com.apotenza.SimpleMacFixes.plist",
  ]
end

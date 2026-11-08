cask "simple-mac-fixes" do
  version "0.1.3"

  on_arm do
    sha256 "977e59836645c9ab027bb617102f41ae8b89a9f9f6a78fb677876a98ab16fa00"

    url "https://github.com/apotenza92/simple-mac-fixes/releases/download/v#{version}/Simple-Mac-Fixes-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "f13b306e7040103c131645badda9bf48e659e38eca366b8f724a2a3723947fd7"

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

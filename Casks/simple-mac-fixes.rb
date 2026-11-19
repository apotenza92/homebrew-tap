cask "simple-mac-fixes" do
  version "0.2.0"

  on_arm do
    sha256 "f76bb468f2273eb26506c7c4f11b6b920db1153ca5a4f2d113b5690cff3e2384"

    url "https://github.com/apotenza92/simple-mac-fixes/releases/download/v#{version}/Simple-Mac-Fixes-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "d2156be18da6ddcb3f7dbcd7c5ef45a1d8cb1a3687ec763851abde529429e443"

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

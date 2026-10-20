cask "simple-mac-fixes" do
  version "0.0.8"

  on_arm do
    sha256 "483a3b8af100a9e6f5573bcac03612436887e20998880fa67e74a8ec63b0573f"

    url "https://github.com/apotenza92/simple-mac-fixes/releases/download/v#{version}/Simple-Mac-Fixes-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "24d39f02de56e21452fbe1913a2175e2cf128914a8392c236ff360aed9e875f8"

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

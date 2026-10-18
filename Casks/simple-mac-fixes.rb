cask "simple-mac-fixes" do
  version "0.0.4"

  on_arm do
    sha256 "849ae3b1a7c44cd171bc059a3848803802f9e792f57c47ebcf1f38a04c838870"

    url "https://github.com/apotenza92/simple-mac-fixes/releases/download/v#{version}/Simple-Mac-Fixes-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "26da7c78bbd1b7596319f4f86914f4fd990029a8b3df8280289ec512185a4804"

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

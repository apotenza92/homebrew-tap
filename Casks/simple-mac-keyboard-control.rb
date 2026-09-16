cask "simple-mac-keyboard-control" do
  version "0.1.3"

  on_arm do
    sha256 "f92a1393fc5f959b04d7b8e792ae0d129bde6d49516c13ffd4501e145de8d0e9"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "5c39ab64e1758390960299a9292a7ee303e998b3f56788d2556dbe716721e553"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-v#{version}-macos-x64.zip"
  end

  name "Simple Mac Keyboard Control"
  desc "Volume and brightness keys for external devices"
  homepage "https://github.com/apotenza92/simple-mac-keyboard-control"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Simple Mac Keyboard Control.app"

  zap trash: [
    "~/Library/Caches/com.apotenza.KeyControl",
    "~/Library/Preferences/com.apotenza.KeyControl.plist",
  ]
end

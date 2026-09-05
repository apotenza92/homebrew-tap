cask "simple-mac-keyboard-control" do
  version "0.1.1"

  on_arm do
    sha256 "2b1c483cb605fb81a0e3f4afb4f4c556e6ff201213dee4203189bcea990897fd"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "d8d5228ee66db6eee0828faef6d52145891f8aee8c2f397711c99b8d541b9dc4"

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

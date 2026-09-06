cask "simple-mac-keyboard-control" do
  version "0.1.2"

  on_arm do
    sha256 "204e1b97e6e307cd1173d3efa341739b35a0b7bd0923d5bcc0356ec5a3985de6"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "14ade218e26c2095bca931023f00128f281236de94a9631de5ea905030c85b77"

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

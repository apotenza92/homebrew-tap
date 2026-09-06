cask "simple-mac-keyboard-control@beta" do
  version "0.1.2"

  on_arm do
    sha256 "e6eee6c0cfc4eed6845a10fa59487b3176a613a20bcd84815c557efc385eae9c"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "9023fffa32b03565cd25d2482fa17a299842bcb3d263a55693df5604aa2ea1fd"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-Beta-v#{version}-macos-x64.zip"
  end

  name "Simple Mac Keyboard Control Beta"
  desc "Volume and brightness keys for external devices"
  homepage "https://github.com/apotenza92/simple-mac-keyboard-control"

  livecheck do
    url "https://api.github.com/repos/apotenza92/simple-mac-keyboard-control/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"].delete_prefix("v") }
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Simple Mac Keyboard Control Beta.app"

  zap trash: [
    "~/Library/Caches/com.apotenza.KeyControl.beta",
    "~/Library/Preferences/com.apotenza.KeyControl.beta.plist",
  ]
end

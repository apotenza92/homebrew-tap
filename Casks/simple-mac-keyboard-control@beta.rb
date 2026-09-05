cask "simple-mac-keyboard-control@beta" do
  version "0.1.1"

  on_arm do
    sha256 "fc09048ef21e224bd403657a77cd89994fe0e59a26ddd2483ee79ac1b8c1eba8"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "75a0500efa54aa4068e97aa7969050b3bcdee3d2bc61c269735629f1659d4307"

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

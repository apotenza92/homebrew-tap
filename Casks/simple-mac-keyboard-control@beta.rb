cask "simple-mac-keyboard-control@beta" do
  version "0.1.3"

  on_arm do
    sha256 "48985fc2eb252a356314dec2e7f5ee39cdb36b7fd15aadf9a8a664a82c0854d1"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "f7b2575c91c8f87e80d5e2bdf70a2f67617306d1065a59a91258ac6053e9c22a"

    url "https://github.com/apotenza92/simple-mac-keyboard-control/releases/download/v#{version}/Simple-Mac-Keyboard-Control-Beta-v#{version}-macos-x64.zip"
  end

  name "Simple Mac Keyboard Control Beta"
  desc "Volume and brightness keys for external devices"
  homepage "https://github.com/apotenza92/simple-mac-keyboard-control"

  livecheck do
    url :url
    strategy :github_releases do |json|
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

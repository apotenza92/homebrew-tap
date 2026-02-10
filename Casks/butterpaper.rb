cask "butterpaper" do
  version "0.0.5"
  sha256 :no_check

  on_arm do
    url "https://github.com/apotenza92/ButterPaper/releases/download/v#{version}/ButterPaper-v#{version}-macos-arm64.zip"
  end

  on_intel do
    url "https://github.com/apotenza92/ButterPaper/releases/download/v#{version}/ButterPaper-v#{version}-macos-x64.zip"
  end

  name "ButterPaper"
  desc "Rust-native desktop PDF app"
  homepage "https://github.com/apotenza92/ButterPaper"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "ButterPaper.app"

  zap trash: [
    "~/Library/Application Support/ButterPaper",
    "~/Library/Caches/com.apotenza92.butterpaper",
    "~/Library/Preferences/com.apotenza92.butterpaper.plist",
    "~/Library/Saved Application State/com.apotenza92.butterpaper.savedState",
  ]
end

cask "butterpaper@beta" do
  version "0.0.2"
  sha256 :no_check

  on_arm do
    url "https://github.com/apotenza92/ButterPaper/releases/download/v#{version}/ButterPaper-Beta-v#{version}-macos-arm64.zip"
  end

  on_intel do
    url "https://github.com/apotenza92/ButterPaper/releases/download/v#{version}/ButterPaper-Beta-v#{version}-macos-x64.zip"
  end

  name "ButterPaper Beta"
  desc "Beta channel for ButterPaper"
  homepage "https://github.com/apotenza92/ButterPaper"

  livecheck do
    url "https://api.github.com/repos/apotenza92/ButterPaper/releases"
    strategy :json do |json|
      json
        .select { |release| release["prerelease"] && !release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "ButterPaper Beta.app"

  zap trash: [
    "~/Library/Application Support/ButterPaper Beta",
    "~/Library/Caches/com.apotenza92.butterpaper.beta",
    "~/Library/Preferences/com.apotenza92.butterpaper.beta.plist",
    "~/Library/Saved Application State/com.apotenza92.butterpaper.beta.savedState",
  ]
end

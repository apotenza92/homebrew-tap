cask "docktor@beta" do
  version "0.0.32"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.32/Docktor-Beta-v0.0.32-macos-arm64.zip"
    sha256 "6292efd8effa672c865f719bd6f59b9ac8c73d7ba46f3ff7ccd0bc149fd3e064"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.32/Docktor-Beta-v0.0.32-macos-x64.zip"
    sha256 "ead3eff89a0bf7f2c846131d25f70ffcdf240287e7f13c1e8a1c82b698fcd371"
  end

  name "Docktor Beta"
  desc "Beta channel for Docktor"
  homepage "https://github.com/apotenza92/docktor"

  livecheck do
    url "https://api.github.com/repos/apotenza92/docktor/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Docktor Beta.app"

  zap trash: [
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
  ]
end

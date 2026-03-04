cask "docktor@beta" do
  version "0.0.29"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.29/Docktor-Beta-v0.0.29-macos-arm64.zip"
    sha256 "526247b9f1e69c1aa07a073e3f26637792d89685d43ddd95ef62693e114eb607"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.29/Docktor-Beta-v0.0.29-macos-x64.zip"
    sha256 "f3cbdab2d1d2870f47c7cc21de15eea0bcedd965fd48a52db3412269c8918427"
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

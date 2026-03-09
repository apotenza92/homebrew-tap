cask "docktor@beta" do
  version "0.0.35"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.35/Docktor-Beta-v0.0.35-macos-arm64.zip"
    sha256 "8248f7c7a7acf66b5852d46da4960d5d2a6cf7760f2cbd525ce7586fe64f3721"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.35/Docktor-Beta-v0.0.35-macos-x64.zip"
    sha256 "e38f7629dccf3cc52e01c671807083de8f50ee28f574cf04d649ac3a2ee0a9fc"
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

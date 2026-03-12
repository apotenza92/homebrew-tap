cask "docktor@beta" do
  version "0.2.0"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.2.0/Docktor-Beta-v0.2.0-macos-arm64.zip"
    sha256 "cebbca751d259614542a2dabeb10d3940f3a8254e82f18a92e7d5ffc373fcda4"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.2.0/Docktor-Beta-v0.2.0-macos-x64.zip"
    sha256 "ab0477b82f5a70f543c3bd79888b0239d6dfd15feb6dd49c26e971d064458ff8"
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

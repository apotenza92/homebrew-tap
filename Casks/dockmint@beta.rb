cask "dockmint@beta" do
  version "0.2.3"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-Beta-v0.2.3-macos-arm64.zip"
    sha256 "3cb65e066553166b08c42fdc823f2b2ad4ff62571f0b8f1f4af092824b0f8134"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-Beta-v0.2.3-macos-x64.zip"
    sha256 "0709d67e0be7ba9eaac2e8545a608be66a9ef2f8748f4396e0ce307c82aec3cb"
  end

  name "Dockmint Beta"
  desc "Beta channel for Dockmint"
  homepage "https://github.com/apotenza92/dockmint"

  livecheck do
    url "https://api.github.com/repos/apotenza92/dockmint/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Dockmint Beta.app"

  zap trash: [
    "~/Library/Application Support/Dockmint Beta",
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Caches/pzc.Dockmint.beta",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Preferences/pzc.Dockmint.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.beta.savedState",
  ]
end

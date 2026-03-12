cask "dockmint@beta" do
  version "0.2.2-beta.2"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2-beta.2/Dockmint-Beta-v0.2.2-beta.2-macos-arm64.zip"
    sha256 "305c77088d3f0f5d173a3ea89c9c4583ca378ddf5cd0eaff82a50f98b71ae8ba"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2-beta.2/Dockmint-Beta-v0.2.2-beta.2-macos-x64.zip"
    sha256 "2480917fc18df96e41e52a4f01811d5cc59a7e7ec220b9b8aa5691050266d0d7"
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

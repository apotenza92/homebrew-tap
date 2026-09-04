cask "dockmint@beta" do
  version "0.4.6"

  on_arm do
    sha256 "dfe8a7570bbb72794db0f1ee14d1170660bf0741fb696ca8ed7af90a748af36d"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "a898ebc103b0ae709374cda72fb23d4f3d438b88a6fcdc44750b721d0812d290"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-Beta-v#{version}-macos-x64.zip"
  end

  name "Dockmint Beta"
  desc "Beta channel for Dockmint"
  homepage "https://github.com/apotenza92/dockmint"

  livecheck do
    url "https://api.github.com/repos/apotenza92/dockmint/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"].delete_prefix("v") }
    end
  end

  depends_on macos: :sonoma

  app "Dockmint Beta.app"

  zap trash: [
    "~/Code/Dockmint/logs",
    "~/Code/Docktor/logs",
    "~/Library/Application Support/Dockmint Beta",
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockmint.beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Logs/Dockmint",
    "~/Library/Preferences/pzc.Dockmint.beta.plist",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Saved Application State/pzc.Dockmint.beta.savedState",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
  ]
end

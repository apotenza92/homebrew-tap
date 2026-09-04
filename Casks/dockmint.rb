cask "dockmint" do
  version "0.4.6"

  on_arm do
    sha256 "be6ec2639d378b893f627f38ec135d7a4ada41d51feb7d29f5f1a7bf99f02245"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "a21c18d121e0e796d8b18ab39d3f63c2501af6c2b42f2ef7928bbd5e3e22b8f0"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-v#{version}-macos-x64.zip"
  end

  name "Dockmint"
  desc "Dock gesture actions"
  homepage "https://github.com/apotenza92/dockmint"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Dockmint.app"

  zap trash: [
    "~/Code/Dockmint/logs",
    "~/Code/Docktor/logs",
    "~/Library/Application Support/Dockmint",
    "~/Library/Application Support/Docktor",
    "~/Library/Caches/pzc.Dockmint",
    "~/Library/Caches/pzc.Dockter",
    "~/Library/Logs/Dockmint",
    "~/Library/Preferences/pzc.Dockmint.plist",
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Saved Application State/pzc.Dockmint.savedState",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
  ]
end

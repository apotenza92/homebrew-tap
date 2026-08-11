cask "dockmint" do
  version "0.4.1"

  on_arm do
    sha256 "d19ef80f480a6d553d6670c65fec22c2e54dd7f0b48031c9bd32520edca903e1"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "334cac0a034d957eec09840762103e8d51ea9b8c0eb62555bb5af5129b2ebea5"

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

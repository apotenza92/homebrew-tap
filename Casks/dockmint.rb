cask "dockmint" do
  version "0.4.2"

  on_arm do
    sha256 "8f25ef4a79f7015734dc47b6c38c4a4b3735f1c15da40b1a10550c05a7a4d067"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "b8aaadea928c1f62c82b48e601dae4d8dc7ffbd6fa00622e511df2f2ccc00eab"

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

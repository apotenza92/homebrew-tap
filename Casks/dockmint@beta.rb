cask "dockmint@beta" do
  version "0.4.2"

  on_arm do
    sha256 "545441dc9fcee8d326404f6a3c412386674d78c025405b4be20c48aad0da024f"

    url "https://github.com/apotenza92/dockmint/releases/download/v#{version}/Dockmint-Beta-v#{version}-macos-arm64.zip"
  end
  on_intel do
    sha256 "d469f3e5d278cb6318e20b89dc0c28e829071add256f3341bee46690174dc9c7"

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

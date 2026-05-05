cask "dockmint@beta" do
  version "0.3.3"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.3/Dockmint-Beta-v0.3.3-macos-arm64.zip"
    sha256 "86a78ec4e7c30bc88cb5f6120c116c659ea7fc7020a4b81d20a383e56b9801e5"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.3/Dockmint-Beta-v0.3.3-macos-x64.zip"
    sha256 "a5f9abe569eb548b02322e8814e40b71aad16192192d1a553b56c44aa1b443f2"
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
    "~/Library/Logs/Dockmint",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Preferences/pzc.Dockmint.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
    "~/Library/Saved Application State/pzc.Dockmint.beta.savedState",
    "~/Code/Dockmint/logs",
    "~/Code/Docktor/logs",
  ]
end

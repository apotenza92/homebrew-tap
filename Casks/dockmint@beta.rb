cask "dockmint@beta" do
  version "0.4.0"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.0/Dockmint-Beta-v0.4.0-macos-arm64.zip"
    sha256 "4b6bcd58b94d0e6790473116625d5440ce0a622ebff8730229290ccf5aa3ec17"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.0/Dockmint-Beta-v0.4.0-macos-x64.zip"
    sha256 "da2ee59c865a619328fb06eb16e8b7fe9ec9c36cf7ca077cc612dddfb5e480e5"
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

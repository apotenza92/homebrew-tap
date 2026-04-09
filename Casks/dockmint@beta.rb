cask "dockmint@beta" do
  version "0.3.1"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.1/Dockmint-Beta-v0.3.1-macos-arm64.zip"
    sha256 "6f51611546bcfa9219f4bc8b29cad40ab19682af97782bfd94dd620404bbd883"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.3.1/Dockmint-Beta-v0.3.1-macos-x64.zip"
    sha256 "4ed1f15d41e7f5723c610302f940f012e0a1377624467d03068a976a34a1c238"
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

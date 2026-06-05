cask "dockmint@beta" do
  version "0.4.0"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.0/Dockmint-Beta-v0.4.0-macos-arm64.zip"
    sha256 "bd457bb3e7291aaa4f62e0a763feda5d8fe4f6415a85f9441f7a839865e3af4c"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.4.0/Dockmint-Beta-v0.4.0-macos-x64.zip"
    sha256 "1255ae20d57dc04fef323c187aedb9467cbf07d47a3557179cf45bed4815de9d"
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

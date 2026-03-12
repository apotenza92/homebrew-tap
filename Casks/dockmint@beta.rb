cask "dockmint@beta" do
  version "0.2.2-beta.1"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2-beta.1/Dockmint-Beta-v0.2.2-beta.1-macos-arm64.zip"
    sha256 "3fac04b87971cc42e4786a76587bc4240286a7b0085685e3965d3ea6e1dcb530"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2-beta.1/Dockmint-Beta-v0.2.2-beta.1-macos-x64.zip"
    sha256 "152a615c589d28a2d7381403abd592acb575ce07d2de52b972c5cf393a70bb55"
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

cask "docktor@beta" do
  version "0.2.2-beta.2"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2-beta.2/Dockmint-Beta-v0.2.2-beta.2-macos-arm64.zip"
    sha256 "cb92f92eca5c0379f7f0aac87c5470d28b84d43a0971b75305a0cc367d650eef"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2-beta.2/Dockmint-Beta-v0.2.2-beta.2-macos-x64.zip"
    sha256 "d684cc118855c05fac1774f228dd5d8bbe5ddf8a859fff586b7486f948adcfb8"
  end

  name "Dockmint Beta"
  desc "Legacy beta alias for Dockmint"
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

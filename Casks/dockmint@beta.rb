cask "dockmint@beta" do
  version "0.2.4"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.4/Dockmint-Beta-v0.2.4-macos-arm64.zip"
    sha256 "419ff242b23b39ab200be06373982fedf49c49913433fd03bc95bca7dd544b54"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.4/Dockmint-Beta-v0.2.4-macos-x64.zip"
    sha256 "f4e3db564e496b5980616bc0e877ff5cb538348202553b20c885b72c89ec1b34"
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

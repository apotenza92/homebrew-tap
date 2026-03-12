cask "docktor@beta" do
  version "0.2.2"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2/Dockmint-Beta-v0.2.2-macos-arm64.zip"
    sha256 "d26b026d1d5b00bd923dc5555e4ce431218a452d29bddc9b4a4fa7cb01a7f69f"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.2/Dockmint-Beta-v0.2.2-macos-x64.zip"
    sha256 "bb71d6c01a8f190d1633c2fe3fbda534f29b1b4c9bd31273ed97316b4433ec7d"
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

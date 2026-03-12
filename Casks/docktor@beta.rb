cask "docktor@beta" do
  version "0.2.3"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-Beta-v0.2.3-macos-arm64.zip"
    sha256 "843dec50abd5dc9f77e9c031543ea3b2975cc4fb850c4c8e474fbbe0abf836c1"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.3/Dockmint-Beta-v0.2.3-macos-x64.zip"
    sha256 "d1229dba4336444b734f1dc8929f79f160f2e6e4469d9c716836606164e5d6ac"
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

cask "dockmint@beta" do
  version "0.2.6"

  on_arm do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.6/Dockmint-Beta-v0.2.6-macos-arm64.zip"
    sha256 "64695382ad64318488cd768e0379fe89652167d41db2ead980d73292a62d7530"
  end

  on_intel do
    url "https://github.com/apotenza92/dockmint/releases/download/v0.2.6/Dockmint-Beta-v0.2.6-macos-x64.zip"
    sha256 "018b93138efe1ddbe60cc60636f027a5fc2a0c011380435c360e96f68d4d556e"
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

cask "docktor" do
  version "0.0.36"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.36/Docktor-v0.0.36-macos-arm64.zip"
    sha256 "f5aa65ef73b382da31c902a4e045eaeea246d0af22c9e422edeb9a40674fcc2d"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.36/Docktor-v0.0.36-macos-x64.zip"
    sha256 "3966d1ca47dfe6bc178d40928fbb4da5c7ea3abc50c984a3c9446cff3632bc70"
  end

  name "Docktor"
  desc "Dock gesture actions for macOS"
  homepage "https://github.com/apotenza92/docktor"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Docktor.app"

  zap trash: [
    "~/Library/Application Support/Docktor",
    "~/Library/Caches/pzc.Dockter",
    "~/Library/Preferences/pzc.Dockter.plist",
    "~/Library/Saved Application State/pzc.Dockter.savedState",
  ]
end

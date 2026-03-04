cask "docktor" do
  version "0.0.31"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.31/Docktor-v0.0.31-macos-arm64.zip"
    sha256 "5425426a734e858c425df2313e04d25bb559eb2b288c195d72757f55fea05891"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.31/Docktor-v0.0.31-macos-x64.zip"
    sha256 "50bbf8a17dca8f4d9e67f205f07021be8e916529d3e74378624a0fc862c10fa1"
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

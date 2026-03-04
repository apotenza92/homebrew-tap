cask "docktor@beta" do
  version "0.0.25"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.25/Docktor-Beta-v0.0.25-macos-arm64.zip"
    sha256 "e85ef94eedb259650d5901a34376f55615b58e0b05ebeadd5999717b17995ebf"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.25/Docktor-Beta-v0.0.25-macos-x64.zip"
    sha256 "9dafed4253c6586221fb880b9f0caa8d4f0b207c9a0d17ce2035d36d6e7c949c"
  end

  name "Docktor Beta"
  desc "Beta channel for Docktor"
  homepage "https://github.com/apotenza92/docktor"

  livecheck do
    url "https://api.github.com/repos/apotenza92/docktor/releases"
    strategy :json do |json|
      json
        .reject { |release| release["draft"] }
        .map { |release| release["tag_name"] }
    end
  end

  app "Docktor Beta.app"

  zap trash: [
    "~/Library/Application Support/Docktor Beta",
    "~/Library/Caches/pzc.Dockter.beta",
    "~/Library/Preferences/pzc.Dockter.beta.plist",
    "~/Library/Saved Application State/pzc.Dockter.beta.savedState",
  ]
end

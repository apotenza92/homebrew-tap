cask "docktor@beta" do
  version "0.0.39"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.39/Docktor-Beta-v0.0.39-macos-arm64.zip"
    sha256 "746a6ae9b198cd7dbe92b2c4401c9da3a12cc3ca0f916f3e4ed7652f2792b5d0"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.39/Docktor-Beta-v0.0.39-macos-x64.zip"
    sha256 "6878fa8867a9e9e0abc6224aebcd7fdea43b8fef5cbe5215f742ac627ef68547"
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

cask "docktor@beta" do
  version "0.0.34"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.34/Docktor-Beta-v0.0.34-macos-arm64.zip"
    sha256 "478bd3315f9e3a85293698194486c464c3722bae397919c7a8a65c1709fab1f3"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.34/Docktor-Beta-v0.0.34-macos-x64.zip"
    sha256 "e6ed61461eb44a61e8072debb4ee430a3b535f543cc4c3a11fa4a0f1caea22e7"
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

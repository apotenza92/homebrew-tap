cask "docktor@beta" do
  version "0.0.10"

  on_arm do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.10/Docktor-Beta-v0.0.10-macos-arm64.zip"
    sha256 "28a2b55df7328ac35d02986da8ab13953fb90fae8419e438a3812802e8ba4244"
  end

  on_intel do
    url "https://github.com/apotenza92/docktor/releases/download/v0.0.10/Docktor-Beta-v0.0.10-macos-x64.zip"
    sha256 "b089c714de555436edde7f93b217978b933bd71d05d3411847439537bbdfe5c2"
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

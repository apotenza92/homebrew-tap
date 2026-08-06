cask "fraia@beta" do
  version "0.0.10"

  on_arm do
    sha256 "9c323155b2bfeeecc704b43aaa0390c52068d6f533a0257ace563415d3c42b32"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "be0413554c0edb9112ec37b91ccbb1d2a6900960a2419e7849750a30e262dfeb"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-Beta-macOS-x64.zip"
  end

  name "Fraia Beta"
  desc "Beta channel for Fraia structural engineering design and analysis"
  homepage "https://github.com/apotenza92/fraia"

  livecheck do
    skip "Updated by trusted Fraia tap automation"
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Fraia Beta.app"

  zap trash: [
    "~/Library/Application Support/Fraia Beta",
    "~/Library/Caches/app.fraia.desktop.beta",
    "~/Library/Caches/app.fraia.desktop.beta.ShipIt",
    "~/Library/Preferences/app.fraia.desktop.beta.plist",
    "~/Library/Saved Application State/app.fraia.desktop.beta.savedState",
  ]
end

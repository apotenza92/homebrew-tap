cask "fraia@beta" do
  version "0.0.11"

  on_arm do
    sha256 "8c1a84463ded6c8fe07c5e5b29ccc4d1c14b874eb0d83a12191dc1f190ebaca0"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "4ab7d3be5d1449e02289d1681396cd3a0d325ff5202b4d6b9201bd341c7bb343"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-Beta-macOS-x64.zip"
  end

  name "Fraia Beta"
  desc "Beta channel for Fraia structural engineering design and analysis"
  homepage "https://github.com/apotenza92/fraia"

  livecheck do
    skip "Updated by trusted Fraia release automation"
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

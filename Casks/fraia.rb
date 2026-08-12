cask "fraia" do
  version "0.0.11"

  on_arm do
    sha256 "f95466bd9d20710cfd7efa622428a4f5fb5e6f18792cf9c90d26d99e472ea01f"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-macOS-arm64.zip"
  end
  on_intel do
    sha256 "d816ae797abd6c9a8176d3c6e49d88c79855e71dd637ad28b448bd29afde1d67"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-macOS-x64.zip"
  end

  name "Fraia"
  desc "AI-assisted structural engineering design and analysis"
  homepage "https://github.com/apotenza92/fraia"

  livecheck do
    skip "Updated by trusted Fraia release automation"
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Fraia.app"

  zap trash: [
    "~/Library/Application Support/Fraia",
    "~/Library/Caches/app.fraia.desktop",
    "~/Library/Caches/app.fraia.desktop.ShipIt",
    "~/Library/Preferences/app.fraia.desktop.plist",
    "~/Library/Saved Application State/app.fraia.desktop.savedState",
  ]
end

cask "fraia" do
  version "0.0.14"

  on_arm do
    sha256 "4dfeeb9a27c344fa3deda629e31e5ab98f75b04b5b560fa85099e2ea3192b930"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-macOS-arm64.zip"
  end
  on_intel do
    sha256 "d9400e71f5fd752afc97bdaaf1dd6056d611b0022539493f6e2ef46cc24081ad"

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

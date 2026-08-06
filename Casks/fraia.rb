cask "fraia" do
  version "0.0.10"

  on_arm do
    sha256 "1f4dc0ee70fe56f86b1c1a42be3cd1129988fe30788e7be41fb79ead8c262da0"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-macOS-arm64.zip"
  end
  on_intel do
    sha256 "3233c601747f6c2de9440d267e7986f0baefaadc632218789efeca051ebed33d"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-macOS-x64.zip"
  end

  name "Fraia"
  desc "AI-assisted structural engineering design and analysis"
  homepage "https://github.com/apotenza92/fraia"

  livecheck do
    skip "Updated by trusted Fraia tap automation"
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

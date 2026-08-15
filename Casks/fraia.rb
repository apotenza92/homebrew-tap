cask "fraia" do
  version "0.0.15"

  on_arm do
    sha256 "29cdb9686cfe6773a7c18b686d6b7c78a714858b12d625d65d32dfe2aa2fdefb"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-macOS-arm64.zip"
  end
  on_intel do
    sha256 "7d83c9fdb7386f35da6e7814095aae76d582deb4cef70618c77f0365dc08db6b"

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

cask "fraia@beta" do
  version "0.0.14"

  on_arm do
    sha256 "b48660af42b6369091f609c76c1eaffa9d0371603f77b77d15b885ae51f3bd0f"

    url "https://github.com/apotenza92/fraia/releases/download/v#{version}/Fraia-Beta-macOS-arm64.zip"
  end
  on_intel do
    sha256 "5af6875c4a71c0787c020119463a86ee54802f9d9ff832923fc1db87c8f74d1c"

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

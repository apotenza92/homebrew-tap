# Homebrew Tap

Homebrew tap for desktop applications published by `apotenza92`.

## Add this tap

```bash
brew tap apotenza92/tap
```

## Install a cask

```bash
brew install --cask apotenza92/tap/<cask-name>
```

## Available examples

```bash
brew install --cask apotenza92/tap/fraia
brew install --cask apotenza92/tap/fraia@beta
brew install --cask apotenza92/tap/facebook-messenger-desktop
brew install --cask apotenza92/tap/facebook-messenger-desktop@beta
```

## Upgrade casks

```bash
brew upgrade --cask
```

Or for a single cask:

```bash
brew upgrade --cask <cask-name>
```

## Uninstall

```bash
brew uninstall --cask <cask-name>
```

## Notes

- All casks are published by trusted tap automation only from source releases
  that contain a checksum-sealed, attested Homebrew bundle. New macOS archives
  must match GitHub's published SHA-256 digests and pass architecture,
  signature, hardened runtime, notarization, stapling, and Gatekeeper checks
  before the casks are updated.
- Stable releases may advance both stable and beta casks when the source
  product's reviewed release contract permits it.
- Use `@beta` tokens when a beta channel cask is available.

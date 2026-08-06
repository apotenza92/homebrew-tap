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

- Messenger stable and beta casks are checked every six hours by trusted tap
  automation. New macOS archives must match GitHub's published SHA-256 digests
  and pass architecture, signature, hardened runtime, notarization, stapling,
  and Gatekeeper checks before the casks are updated.
- Fraia stable and beta casks use the same fail-closed verification and update
  automatically from approved Fraia releases. A final stable release may
  advance both casks when it includes the separately signed Fraia Beta app.
- Use `@beta` tokens when a beta channel cask is available.

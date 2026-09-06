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

### KeyControl release reconciliation

`reconcile-keycontrol.yml` checks stable and beta every ten minutes (GitHub may
schedule jobs late). Current cask versions skip the publishing job; new eligible
releases still pass the source-run, provenance, package and audit checks in the
existing publisher. The app repository never receives tap write credentials.
Manual dispatch of this workflow provides recovery without reconstructing inputs.

Online audits retry only network/rate-limit failures, at most twice with 30/90
second backoff. Response/rate-limit diagnostics omit request credentials and
bodies. Checksums, signatures, attestations and ordinary version disagreements
remain fatal. Failed retries leave casks unpublished and the job red.

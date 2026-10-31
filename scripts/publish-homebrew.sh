#!/usr/bin/env bash
set -euo pipefail

summary_file="${RUNNER_TEMP:?}/homebrew-publication-summary.json"

tap_path="$(brew --repository)/Library/Taps/apotenza92/homebrew-tap"
mkdir -p "$(dirname "$tap_path")"
if [[ ! -e "$tap_path" ]]; then ln -s "$GITHUB_WORKSPACE" "$tap_path"; fi
# Homebrew 7 refuses to load casks from untrusted third-party taps.
brew trust --tap apotenza92/tap

python3 scripts/homebrew_publication.py \
  --product "${PRODUCT:?}" \
  --tag "${RELEASE_TAG:?}" \
  --commit "${RELEASE_COMMIT:?}" \
  --run-id "${SOURCE_RUN_ID:?}" \
  --run-attempt "${SOURCE_RUN_ATTEMPT:?}" \
  --correlation "${CORRELATION_ID:?}" \
  --apply | tee "$summary_file"

# Stable-only products have no beta cask.
casks=("${STABLE_CASK:?}")
[[ -n "${BETA_CASK:-}" ]] && casks+=("$BETA_CASK")
cask_paths=()
for cask in "${casks[@]}"; do
  ruby -c "Casks/$cask"
  cask_paths+=("Casks/$cask")
done
brew style "${cask_paths[@]}"
python3 scripts/audit_with_retry.py "apotenza92/tap/${STABLE_CASK%.rb}"
# Beta casks point at GitHub pre-releases by design; every other check stays.
if [[ -n "${BETA_CASK:-}" ]]; then
  python3 scripts/audit_with_retry.py --except=github_prerelease_version "apotenza92/tap/${BETA_CASK%.rb}"
fi
git diff --check -- Casks

changed=()
while IFS= read -r cask; do
  [[ -n "$cask" ]] && changed+=("$cask")
done < <(python3 -c 'import json,sys; print("\n".join(json.load(open(sys.argv[1]))["changed_casks"]))' "$summary_file")
if [[ ${#changed[@]} -eq 0 ]]; then
  echo "Homebrew casks are already current."
  echo 'changed=false' >> "$GITHUB_OUTPUT"
  exit 0
fi

paths=()
for cask in "${changed[@]}"; do paths+=("Casks/$cask"); done
git add -- "${paths[@]}"
git diff --cached --name-only --diff-filter=ACMRTUXB | diff -u <(printf '%s\n' "${paths[@]}" | LC_ALL=C sort) <(git diff --cached --name-only | LC_ALL=C sort)
git config user.name 'homebrew-publisher[bot]'
git config user.email 'homebrew-publisher[bot]@users.noreply.github.com'
git commit -m "homebrew: publish $PRODUCT $RELEASE_TAG"

for attempt in 1 2 3; do
  if git push origin HEAD:main; then break; fi
  [[ $attempt -lt 3 ]]
  git fetch origin main
  git rebase origin/main
done

tap_commit="$(git rev-parse HEAD)"
remote_commit="$(git ls-remote origin refs/heads/main | cut -f1)"
[[ "$tap_commit" == "$remote_commit" ]]
for path in "${paths[@]}"; do
  curl --fail --location --retry 5 \
    --retry-all-errors \
    "https://raw.githubusercontent.com/apotenza92/homebrew-tap/$tap_commit/$path" \
    --output "$RUNNER_TEMP/$(basename "$path")"
  cmp --silent "$path" "$RUNNER_TEMP/$(basename "$path")"
done

echo 'changed=true' >> "$GITHUB_OUTPUT"
echo "tap_commit=$tap_commit" >> "$GITHUB_OUTPUT"
echo "changed_casks=$(IFS=,; echo "${changed[*]}")" >> "$GITHUB_OUTPUT"

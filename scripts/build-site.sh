#!/bin/bash
# Builds the Mouse on Phone website (download, support and privacy pages) into _site/ for GitHub Pages.
# The public downloads repository deploys _site/ with its GitHub Pages workflow.
#
# Sources: scripts/site/ (landing page and template), site/content/ (published policy/support), site/ (static files).
# The download link points to the newest release's Mouse-on-Phone.zip (see publish-mac-release.sh).
#
# Usage:  DOWNLOADS_REPO=owner/name scripts/build-site.sh
#         DOWNLOADS_REPO=owner/name ALLOW_DRAFT=1 scripts/build-site.sh   (a local preview only)
set -euo pipefail
cd "$(dirname "$0")/.."

REPO="${DOWNLOADS_REPO:?Set DOWNLOADS_REPO to the public repository, for example owner/name}"
[ "$REPO" = thribhu/phonepad-downloads ] || { echo "Unexpected downloads repository." >&2; exit 1; }
command -v pandoc >/dev/null || { echo "pandoc is needed: brew install pandoc (or apt-get install pandoc)"; exit 1; }
OUT=_site
SRC=scripts/site
RELEASES_URL="https://github.com/$REPO/releases"
DOWNLOAD_URL="$RELEASES_URL/latest/download/Mouse-on-Phone.zip"
ISSUES_URL="https://github.com/$REPO/issues"

# The public pages must not ship a draft notice or template placeholders such as [date].
if [ "${ALLOW_DRAFT:-}" != 1 ]; then
    problems=$(grep -niE '^>?[ *#]*draft|^#.*\(draft\)|\[[^]]+\]([^(]|$)' site/content/PRIVACY.md site/content/SUPPORT.md "$SRC/index.md" || true)
    if [ -n "$problems" ]; then
        echo "Remove the draft notice and fill in the placeholders before publishing:"
        echo "$problems"
        exit 1
    fi
fi

rm -rf "$OUT" && mkdir -p "$OUT/privacy" "$OUT/support"
cp -R site/. "$OUT/"

render() {   # render <markdown> <output file> <root path> <page title>
    local tmp
    tmp=$(mktemp)
    pandoc --standalone --from markdown --to html5 --wrap=none \
        --template "$SRC/template.html" --metadata pagetitle="$4" -V root="$3" "$1" -o "$tmp"
    sed -e "s#@DOWNLOAD_URL@#$DOWNLOAD_URL#g" -e "s#@RELEASES_URL@#$RELEASES_URL#g" \
        -e "s#@ISSUES_URL@#$ISSUES_URL#g" "$tmp" > "$2"
    rm -f "$tmp"
}
render "$SRC/index.md" "$OUT/index.html" "./" "Mouse on Phone"
render site/content/PRIVACY.md "$OUT/privacy/index.html" "../" "Privacy policy"
render site/content/SUPPORT.md "$OUT/support/index.html" "../" "Support"
python3 scripts/site-release.py --output "$OUT/releases.json" --render "$OUT/index.html"
if grep -qE '@[A-Z_]+@' "$OUT/index.html"; then
    echo "The website still contains template placeholders." >&2
    exit 1
fi
echo "Built $OUT/ for $REPO. Preview: python3 -m http.server 8000 --directory $OUT"

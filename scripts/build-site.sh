#!/bin/bash
# Builds the Mouse on Phone website (download, support and privacy pages) into _site/ for GitHub Pages.
# scripts/publish-site.sh publishes _site/ to the gh-pages branch. Nothing else hosts the site.
#
# Sources: scripts/site/ (landing page and template), docs/PRIVACY.md, docs/SUPPORT.md, site/ (static files).
# The download link points to the newest release's Mouse-on-Phone.zip (see publish-mac-release.sh).
#
# Usage:  DOWNLOADS_REPO=owner/name scripts/build-site.sh
#         DOWNLOADS_REPO=owner/name ALLOW_DRAFT=1 scripts/build-site.sh   (a local preview only)
set -euo pipefail
cd "$(dirname "$0")/.."

REPO="${DOWNLOADS_REPO:?Set DOWNLOADS_REPO to the public repository, for example owner/name}"
command -v pandoc >/dev/null || { echo "pandoc is needed: brew install pandoc (or apt-get install pandoc)"; exit 1; }
OUT=_site
SRC=scripts/site
RELEASES_URL="https://github.com/$REPO/releases"
DOWNLOAD_URL="$RELEASES_URL/latest/download/Mouse-on-Phone.zip"
ISSUES_URL="https://github.com/$REPO/issues"

# The public pages must not ship a draft notice or template placeholders such as [date].
if [ "${ALLOW_DRAFT:-}" != 1 ]; then
    problems=$(grep -nE '^> Draft|^#.*\(draft\)|\[[^]]+\]([^(]|$)' docs/PRIVACY.md docs/SUPPORT.md "$SRC/index.md" || true)
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
render docs/PRIVACY.md "$OUT/privacy/index.html" "../" "Privacy policy"
render docs/SUPPORT.md "$OUT/support/index.html" "../" "Support"
echo "Built $OUT/ for $REPO. Preview: python3 -m http.server 8000 --directory $OUT"

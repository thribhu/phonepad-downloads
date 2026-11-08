#!/usr/bin/env python3
"""Read only published releases; render their versions into the download page."""
import argparse
import html
import json
import os
import re
import urllib.request
from pathlib import Path

APP_ID = 6824015332
REPOSITORY = "thribhu/phonepad-downloads"


def read_json(url, token=None):
    headers = {"User-Agent": "PhonePad-release-site", "Accept": "application/json"}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=30) as response:
        return json.load(response)


def published_releases(apple, github):
    apps = [app for app in apple.get("results", []) if app.get("trackId") == APP_ID
            and app.get("bundleId") == "com.iam3bu1.phonepad"]
    if len(apps) != 1:
        raise ValueError("Apple did not return the expected public app. Keep the existing site.")
    app = apps[0]
    if github.get("draft") is not False or github.get("prerelease") is not False:
        raise ValueError("The Mac release must be public and stable.")
    tag = github["tag_name"]
    if not re.fullmatch(r"v[0-9]+\.[0-9]+(?:\.[0-9]+)?", tag):
        raise ValueError("Unexpected Mac version tag.")
    if not re.fullmatch(r"[0-9]+\.[0-9]+(?:\.[0-9]+)?", app["version"]):
        raise ValueError("Unexpected App Store version.")
    release_url = f"https://github.com/{REPOSITORY}/releases/tag/{tag}"
    if github.get("html_url") != release_url or not github.get("published_at"):
        raise ValueError("Unexpected Mac release URL or publication date.")
    assets = {asset["name"]: asset for asset in github.get("assets", [])}
    for name in ["Mouse-on-Phone.zip", "Mouse-on-Phone.zip.sha256"]:
        expected = f"https://github.com/{REPOSITORY}/releases/download/{tag}/{name}"
        if assets.get(name, {}).get("browser_download_url") != expected or assets[name].get("state") != "uploaded":
            raise ValueError(f"The latest Mac release is missing {name}.")
    return {
        "ios": {"version": app["version"], "url": f"https://apps.apple.com/app/id{APP_ID}",
                "released": app["currentVersionReleaseDate"][:10]},
        "mac": {"version": tag[1:], "url": release_url, "released": github["published_at"][:10],
                "download": assets["Mouse-on-Phone.zip"]["browser_download_url"]},
    }


def render(path, releases):
    values = {"@APP_STORE_URL@": releases["ios"]["url"],
              "@IOS_VERSION@": releases["ios"]["version"],
              "@IOS_RELEASE_DATE@": releases["ios"]["released"],
              "@MAC_VERSION@": releases["mac"]["version"],
              "@MAC_RELEASE_DATE@": releases["mac"]["released"],
              "@MAC_RELEASE_URL@": releases["mac"]["url"]}
    content = path.read_text()
    for key, value in values.items():
        content = content.replace(key, html.escape(value, quote=True))
    path.write_text(content)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", default="_site/releases.json")
    parser.add_argument("--render", type=Path)
    args = parser.parse_args()
    try:
        releases = published_releases(
            read_json(f"https://itunes.apple.com/lookup?id={APP_ID}&country=us"),
            read_json(f"https://api.github.com/repos/{REPOSITORY}/releases/latest", os.getenv("GH_TOKEN")),
        )
        output = Path(args.output)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(releases, indent=2) + "\n")
        if args.render:
            render(args.render, releases)
        print(f"Published releases: iOS {releases['ios']['version']}; Mac {releases['mac']['version']}.")
    except (ValueError, KeyError, OSError) as error:
        parser.exit(1, f"Site release check failed: {error}\n")

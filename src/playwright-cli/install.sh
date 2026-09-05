#!/bin/sh
set -eu

VERSION="${VERSION:-latest}"
BROWSERS="${BROWSERS:-}"
BROWSER_PATH="/ms-playwright"
installed_browsers=""

if ! command -v apt-get >/dev/null 2>&1; then
  echo "The playwright-cli Feature supports Debian and Ubuntu." >&2
  exit 1
fi

if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
  echo "Node.js and npm are required but were not installed by the Node Feature." >&2
  exit 1
fi

npm install --global "@playwright/cli@$VERSION"

mkdir -p "$BROWSER_PATH"
export PLAYWRIGHT_BROWSERS_PATH="$BROWSER_PATH"

old_ifs="$IFS"
IFS=','
for untrimmed_browser in $BROWSERS; do
  IFS="$old_ifs"
  browser="$(printf '%s' "$untrimmed_browser" | tr -d '[:space:]')"
  IFS=','

  [ -n "$browser" ] || continue
  case "$browser" in
    chromium|firefox|webkit|chrome|chrome-beta|msedge|msedge-beta) ;;
    *)
      echo "Unsupported Playwright browser '$browser'." >&2
      echo "Supported values: chromium, firefox, webkit, chrome, chrome-beta, msedge, msedge-beta." >&2
      exit 1
      ;;
  esac

  case ",$installed_browsers," in
    *",$browser,"*) continue ;;
  esac
  playwright-cli install-browser "$browser" --with-deps
  installed_browsers="${installed_browsers:-},$browser"
done
IFS="$old_ifs"

chmod -R a+rX "$BROWSER_PATH"
playwright-cli --version

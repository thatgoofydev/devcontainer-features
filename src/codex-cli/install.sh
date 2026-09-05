#!/bin/sh
set -eu

VERSION="${VERSION:-latest}"
AUTO_UPDATE="${AUTOUPDATE:-true}"
INSTALL_ROOT="/opt/codex"
INSTALL_BIN="$INSTALL_ROOT/bin"
INSTALL_STATE="$INSTALL_ROOT/state"
UPDATER="/usr/local/bin/codex-feature-update"

if ! command -v apt-get >/dev/null 2>&1; then
  echo "The codex-cli Feature supports Debian and Ubuntu." >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends ca-certificates curl
rm -rf /var/lib/apt/lists/*

mkdir -p "$INSTALL_BIN" "$INSTALL_STATE"

installer_file="$(mktemp)"
trap 'rm -f "$installer_file"' EXIT
curl -fsSL https://chatgpt.com/codex/install.sh -o "$installer_file"
CODEX_INSTALL_DIR="$INSTALL_BIN" \
CODEX_HOME="$INSTALL_STATE" \
CODEX_NON_INTERACTIVE=1 \
PATH="$INSTALL_BIN:$PATH" \
  sh "$installer_file" --release "$VERSION"

cat >"$INSTALL_ROOT/feature.env" <<EOF
CODEX_FEATURE_VERSION='$VERSION'
CODEX_FEATURE_AUTO_UPDATE='$AUTO_UPDATE'
EOF

cat >"$UPDATER" <<'EOF'
#!/bin/sh
set -u

INSTALL_ROOT="/opt/codex"
. "$INSTALL_ROOT/feature.env"

if [ "$CODEX_FEATURE_AUTO_UPDATE" != "true" ]; then
  exit 0
fi

installer_file="$(mktemp)" || exit 0
trap 'rm -f "$installer_file"' EXIT

if ! curl -fsSL https://chatgpt.com/codex/install.sh -o "$installer_file"; then
  echo "codex-cli: automatic update skipped because the installer could not be downloaded." >&2
  exit 0
fi

if ! CODEX_INSTALL_DIR="$INSTALL_ROOT/bin" \
  CODEX_HOME="$INSTALL_ROOT/state" \
  CODEX_NON_INTERACTIVE=1 \
  PATH="$INSTALL_ROOT/bin:$PATH" \
  sh "$installer_file" --release "$CODEX_FEATURE_VERSION"; then
  echo "codex-cli: automatic update failed; continuing with the installed version." >&2
fi

exit 0
EOF

chmod 0755 "$UPDATER"

runtime_user="${_REMOTE_USER:-${_CONTAINER_USER:-root}}"
if [ -z "$runtime_user" ] || ! id "$runtime_user" >/dev/null 2>&1; then
  runtime_user=root
fi
runtime_group="$(id -gn "$runtime_user")"
chown -R "$runtime_user:$runtime_group" "$INSTALL_ROOT"

ln -sf "$INSTALL_BIN/codex" /usr/local/bin/codex
if [ -e "$INSTALL_BIN/codex-code-mode-host" ]; then
  ln -sf "$INSTALL_BIN/codex-code-mode-host" /usr/local/bin/codex-code-mode-host
fi

codex --version

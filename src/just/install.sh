#!/bin/sh
set -eu

VERSION="${VERSION:-latest}"

install_dependencies() {
  if command -v apt-get >/dev/null 2>&1; then
    export DEBIAN_FRONTEND=noninteractive
    apt-get update
    apt-get install -y --no-install-recommends bash ca-certificates curl
    rm -rf /var/lib/apt/lists/*
  elif command -v apk >/dev/null 2>&1; then
    apk add --no-cache bash ca-certificates curl
  else
    echo "The just Feature supports Debian, Ubuntu, and Alpine." >&2
    exit 1
  fi
}

install_dependencies

installer_file="$(mktemp)"
trap 'rm -f "$installer_file"' EXIT
curl --proto '=https' --tlsv1.2 -fsSL https://just.systems/install.sh -o "$installer_file"

if [ "$VERSION" = "latest" ]; then
  bash "$installer_file" --to /usr/local/bin
else
  bash "$installer_file" --tag "$VERSION" --to /usr/local/bin
fi

just --version

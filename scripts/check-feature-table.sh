#!/bin/sh
set -eu

expected="$(mktemp)"
actual="$(mktemp)"
trap 'rm -f "$expected" "$actual"' EXIT

{
  echo '<!-- feature-table:start -->'
  echo '| Feature | Description | Version |'
  echo '| --- | --- | --- |'
  for metadata in src/*/devcontainer-feature.json; do
    id="$(jq -r .id "$metadata")"
    description="$(jq -r .description "$metadata" | sed 's/|/\\|/g')"
    version="$(jq -r .version "$metadata")"
    printf '| [`%s`](src/%s) | %s | `%s` |\n' "$id" "$id" "$description" "$version"
  done
  echo '<!-- feature-table:end -->'
} >"$expected"

sed -n '/<!-- feature-table:start -->/,/<!-- feature-table:end -->/p' README.md >"$actual"

if ! diff -u "$expected" "$actual"; then
  echo "README.md Feature table is out of date. Use .agents/skills/update-feature-table." >&2
  exit 1
fi

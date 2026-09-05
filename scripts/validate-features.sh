#!/bin/sh
set -eu

output_dir="$(mktemp -d)"
trap 'rm -rf "$output_dir"' EXIT

npm exec -- devcontainer features package ./src --output-folder "$output_dir" --force-clean-output-folder

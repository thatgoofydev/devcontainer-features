#!/bin/bash
set -e

source dev-container-features-test-lib

check "codex is available to the remote user" codex --version
check "automatic updates are disabled" grep -F "CODEX_FEATURE_AUTO_UPDATE='false'" /opt/codex/feature.env
check "disabled updater exits successfully" codex-feature-update

reportResults

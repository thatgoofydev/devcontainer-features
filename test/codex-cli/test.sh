#!/bin/bash
set -e

source dev-container-features-test-lib

check "codex is installed" codex --version
check "update helper is installed" test -x /usr/local/bin/codex-feature-update
check "automatic updates default to enabled" grep -F "CODEX_FEATURE_AUTO_UPDATE='true'" /opt/codex/feature.env

reportResults

#!/bin/bash
set -e

source dev-container-features-test-lib

check "codex is available to the remote user" codex --version
check "automatic updates are enabled" grep -F "CODEX_FEATURE_AUTO_UPDATE='true'" /opt/codex/feature.env
check "remote user can update the installation" test -w /opt/codex/state

reportResults

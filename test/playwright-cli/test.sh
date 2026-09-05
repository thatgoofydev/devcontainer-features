#!/bin/bash
set -e

source dev-container-features-test-lib

check "playwright-cli is installed" playwright-cli --version
check "shared browser path is configured" bash -c 'test "$PLAYWRIGHT_BROWSERS_PATH" = /ms-playwright'

reportResults

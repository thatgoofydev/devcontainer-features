#!/bin/bash
set -e

source dev-container-features-test-lib

check "playwright-cli is available to the remote user" playwright-cli --version
check "Chromium launches" bash -c 'playwright-cli open about:blank --browser=chromium && playwright-cli close'

reportResults

#!/bin/bash
set -e

source dev-container-features-test-lib

check "just is installed" just --version
check "codex is installed" codex --version
check "playwright-cli is installed" playwright-cli --version

reportResults

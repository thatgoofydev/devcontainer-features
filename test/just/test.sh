#!/bin/bash
set -e

source dev-container-features-test-lib

check "just is installed" just --version
check "just executes a recipe" bash -c 'workdir=$(mktemp -d); printf "hello:\n\t@echo hello-from-just\n" > "$workdir/justfile"; just --justfile "$workdir/justfile" hello | grep -F hello-from-just'

reportResults

# Changelog

All notable changes to this Feature are documented in this file.

## [0.1.1] - 2026-09-05

### Fixed

- Ensure the automatic updater can write its shared package state when the
  container runtime user differs from the build-time user.

## [0.1.0] - 2026-09-05

### Added

- Initial pre-release of the `codex-cli` Feature.
- Installation through OpenAI's official standalone installer.
- Exact-version and latest-release selection.
- Best-effort automatic updates at container start, enabled by default.
- Runtime-user ownership without sharing the user's Codex authentication state.

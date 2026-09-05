# Dev Container Features

Dev Container Features published by [thatgoofydev](https://github.com/thatgoofydev).

> This collection is pre-release. The initial Features are versioned `0.1.0` while their interfaces and platform coverage are validated. Stable `1.0.0` releases will follow once the collection has proven reliable.

## Available Features

<!-- feature-table:start -->
| Feature | Description | Version |
| --- | --- | --- |
| [`codex-cli`](src/codex-cli) | Installs OpenAI Codex CLI with optional automatic updates when the container starts. | `0.1.1` |
| [`just`](src/just) | Installs just, a command runner for project-specific tasks. | `0.1.0` |
| [`playwright-cli`](src/playwright-cli) | Installs Playwright CLI for coding agents, with optional browser installation. | `0.1.0` |
<!-- feature-table:end -->

## Usage

Add a Feature to `.devcontainer/devcontainer.json`:

```json
{
  "features": {
    "ghcr.io/thatgoofydev/devcontainer-features/just:1": {}
  }
}
```

Install selected Playwright browsers explicitly:

```json
{
  "features": {
    "ghcr.io/thatgoofydev/devcontainer-features/playwright-cli:1": {
      "browsers": "chromium,firefox"
    }
  }
}
```

Each Feature directory contains its options, compatibility notes, and changelog.

## Development

Open the repository in its development container, then use the root `justfile`:

```console
just validate
just test just
just test-scenarios playwright-cli
just test-all
```

The repository follows the [Dev Container Feature specification](https://containers.dev/implementors/features/) and publishes Features to GitHub Container Registry.

## License

Licensed under the [MIT License](LICENSE).

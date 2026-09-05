Installs Codex CLI through OpenAI's official standalone installer. The application is stored under `/opt/codex` and exposed as `/usr/local/bin/codex`; user authentication and configuration remain in the runtime user's normal `~/.codex` directory.

Automatic updates are enabled by default. At each container start, the Feature re-runs the official installer without blocking startup on network or update failures:

- `version: "latest"` tracks the newest release.
- An exact `version` remains pinned to that version.
- Set `autoUpdate` to `false` for an immutable installation after the image build.

The update mechanism requires outbound access to `https://chatgpt.com` and the Codex release host. Debian and Ubuntu are supported.

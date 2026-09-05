Installs the requested release of [`just`](https://github.com/casey/just) into `/usr/local/bin`.

Supported base distributions are Debian, Ubuntu, and Alpine. The Feature currently targets Linux `amd64` and `arm64` releases provided by upstream.

When `version` is `latest`, the upstream installer resolves the newest release during the image build. Specify an exact version for reproducible builds.

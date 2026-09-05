Installs Microsoft's [`@playwright/cli`](https://github.com/microsoft/playwright-cli) package globally. The official Dev Container Node Feature supplies Node.js.

No browser is downloaded during the image build unless `browsers` is set. Provide a comma-separated list such as `chromium,firefox`; whitespace and duplicate values are ignored. Browser binaries are stored in `/ms-playwright` and their Linux system dependencies are installed through `playwright-cli install-browser --with-deps`.

Supported bases are Debian and Ubuntu. Playwright does not support its Firefox and WebKit builds on Alpine Linux.

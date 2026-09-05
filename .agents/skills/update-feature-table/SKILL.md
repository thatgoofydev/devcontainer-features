---
name: update-feature-table
description: Keep the Available Features table in the root README synchronized whenever a Dev Container Feature under src/ is created, renamed, removed, or its version or description changes.
---

# Update the Feature table

Read every `src/*/devcontainer-feature.json` and update only the table between `<!-- feature-table:start -->` and `<!-- feature-table:end -->` in the root `README.md`.

- Include one row per Feature, sorted by Feature `id`.
- Link the ID to `src/<id>`.
- Copy the description and version from `devcontainer-feature.json` exactly.
- Preserve the marker comments and all README content outside them.
- Remove rows for Features that no longer exist.

Before committing, compare the table against all Feature metadata and run `just check`.

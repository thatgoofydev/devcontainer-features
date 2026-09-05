# Update Feature table

Synchronizes the Available Features table in the root `README.md` with every
Feature's `devcontainer-feature.json` metadata.

## Usage

This skill is selected automatically when a Feature is created, renamed,
removed, or its description/version changes. It can also be invoked explicitly
as `$update-feature-table`.

## Options

| Option | Default | Available values |
| --- | --- | --- |
| Table location | Root `README.md` marker block | `<!-- feature-table:start -->` through `<!-- feature-table:end -->` |
| Row order | Feature ID ascending | Any metadata IDs are accepted; output is always sorted |
| Row fields | Metadata `id`, `description`, and `version` | One row per existing Feature |

Content outside the marker block is preserved. Run `just check` to verify the
table before committing.

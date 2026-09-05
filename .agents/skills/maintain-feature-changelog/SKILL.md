---
name: maintain-feature-changelog
description: Update a Dev Container Feature's semantic version and CHANGELOG.md whenever a Feature under src/ is created or behavior, options, installation, compatibility, or documentation are changed.
---

# Maintain Feature changelogs

For every affected `src/<feature>` directory:

1. Read its `devcontainer-feature.json`, `CHANGELOG.md`, and the actual change.
2. Choose the next Feature version independently from the installed tool version:
   - Patch for backward-compatible fixes or documentation corrections.
   - Minor for backward-compatible options or capabilities.
   - Major for incompatible behavior after `1.0.0`; before `1.0.0`, use a minor bump and clearly label the instability.
3. Update `version` in `devcontainer-feature.json` and add a dated changelog entry in `YYYY-MM-DD` form.
4. Describe observable user impact. For an incompatible change, add a `Breaking changes` subsection explaining who is affected and how to migrate.
5. Keep prior entries unchanged and newest entries first.

Before committing, inspect the complete diff for each affected Feature and verify that its metadata version has a matching `## [version]` changelog entry. Run `just check`.

Do not bump unrelated Features or use the upstream application's version as the Feature version.

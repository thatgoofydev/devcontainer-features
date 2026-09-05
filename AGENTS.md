# Repository instructions

When creating or changing anything under `src/<feature>/`, use both repository skills before considering the work complete:

- `.agents/skills/maintain-feature-changelog/SKILL.md` updates the Feature version and changelog, and verifies them before commit.
- `.agents/skills/update-feature-table/SKILL.md` keeps the Available Features table in `README.md` synchronized with Feature metadata.

Run `just check` before committing. Feature install scripts must work non-interactively, preserve the configured remote user's runtime state, and include tests for changed behavior.

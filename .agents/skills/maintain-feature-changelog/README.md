# Maintain Feature changelog

Keeps a Feature's semantic version and `CHANGELOG.md` aligned whenever a
Feature under `src/` is created or changed.

## Usage

This skill is selected automatically for Feature changes. It can also be
invoked explicitly as `$maintain-feature-changelog`.

## Options

| Option | Default | Available values |
| --- | --- | --- |
| Version increment | Inferred from the change | `patch`, `minor`, `major` (major applies after `1.0.0`; pre-1.0 breaking changes use `minor`) |
| Changelog date | Current date | `YYYY-MM-DD` |

The skill updates only affected Features, puts newest entries first, records
observable user impact, and verifies the metadata version has a matching
changelog heading before committing.

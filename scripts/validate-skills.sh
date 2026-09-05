#!/bin/sh
set -eu

for skill_dir in .agents/skills/*; do
  skill="$skill_dir/SKILL.md"
  readme="$skill_dir/README.md"
  [ -f "$skill" ] || {
    echo "$skill_dir does not contain SKILL.md" >&2
    exit 1
  }
  [ -f "$readme" ] || {
    echo "$skill_dir does not contain README.md" >&2
    exit 1
  }
  [ "$(sed -n '1p' "$skill")" = "---" ] || {
    echo "$skill is missing YAML frontmatter" >&2
    exit 1
  }
  grep -Eq '^name: [a-z0-9-]+$' "$skill" || {
    echo "$skill has an invalid or missing name" >&2
    exit 1
  }
  grep -Eq '^description: .+' "$skill" || {
    echo "$skill is missing a description" >&2
    exit 1
  }
done

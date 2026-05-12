Generate a pull request description for the current branch against main.

1. Run `git log main..HEAD --oneline` to review all commits
2. Run `git diff main...HEAD --stat` for a changed-files overview
3. Use `git diff main...HEAD` for full context where needed

Output a PR description in this format:

**Title**: `type(scope): subject` (≤72 chars, imperative mood)

---

## Summary
- [2–3 bullets: what changed and why]

## Test plan
- [ ] [step to verify each change]

## Notes
[Breaking changes, migrations, deploy steps — omit if none]

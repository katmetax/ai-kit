---
name: commit-message
description: Writes commit messages for the current working changes.
---

Format: `type(scope): subject`
Types: `feat` `fix` `refactor` `test` `docs` `chore` `style` `perf`
- Subject: ≤72 chars, imperative mood (`add X`, not `added X`), no trailing period
- Body (optional): explain *why*, not *what*; wrap at 72 chars
- Breaking changes: add `BREAKING CHANGE: description` footer

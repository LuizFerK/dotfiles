Create a git commit for the current working directory following the project's commit rules.

## Rules

- Follow Conventional Commits: `feat:`, `fix:`, `chore:`, `refactor:`, `docs:`, etc.
- Never add AI as author or co-author.
- Never push to remote.
- Never open pull requests.
- Only commit what is staged. If nothing is staged, stage relevant files first based on what changed — but do not stage unrelated files.

## Steps

1. Run `git status` and `git diff` (staged and unstaged) to understand what changed.
2. Run `git log --oneline -10` to match the existing commit style in this repo.
3. Draft a commit message following the 50/72 rule:
   - Subject line: imperative mood, ≤50 chars (hard max 72)
   - Blank line between subject and body
   - Body lines: wrap at 72 chars
   - Body only when the why is non-obvious
4. Show the message to the user for confirmation before committing.
5. Commit with `git commit -m`.

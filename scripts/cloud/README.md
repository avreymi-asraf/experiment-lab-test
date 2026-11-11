# Running the Lab in a Claude Code Cloud Session

What a cloud session (and every subagent it starts) needs to clone target repos, open and push experiment worktrees, and rent Colab GPUs with the user's account. Checked on 2026-11-11 with Claude Code 2.1.x and `google-colab-cli` 0.8.0.

## What Each Piece Is For

| Piece | Where | Why it is there and not elsewhere |
|---|---|---|
| `setup.sh` | Environment → **Setup script** | Installs `ssh` and the Colab CLI (pinned) and puts the `colab` wrapper on PATH. Setup scripts run once per fresh container and are cached, and they **cannot read environment variables**, so nothing here needs a secret. |
| `colab` (wrapper) | `/usr/local/bin/colab` | Turns `COLAB_TOKEN_JSON` into Google credentials at call time and adds `--auth=adc`. A file on PATH reaches the main agent, subagents and `subprocess.run(["colab", ...])` in target code alike. A shell function or a SessionStart hook would not: repo hooks do not run in sessions with several repositories. |
| `COLAB_TOKEN_JSON` | Environment → **Environment variables** | The user's Colab login (a refresh token). It must be an environment variable, not a network secret, because the CLI mints its own short-lived access tokens from it. |
| `HF_TOKEN` and other `.env.example` names | Environment → **Environment variables** | Read by `lab.py run`/`evaluate` and uploaded to Colab as `.env` (colab-cli skill → Secrets). |
| Allowed domains | Environment → **Network access** | Colab is not on the default list. See below. |
| Repositories | Environment → **Repositories**, or `add_repo` mid-session | Git reaches a private repo only after it is attached to the session. Public ones always clone. |
| `check.sh` | Run by hand | One line per item, OK / MISSING / FAIL, never prints a secret. Run it at the start of any session or subagent that will rent Colab or push. |

## One-Time Setup (the User Does This)

1. **Export the Colab login** on a machine with a browser (Linux or macOS):
   ```bash
   uv tool install google-colab-cli
   colab whoami        # first run: open the URL, approve every scope checkbox, paste the code back
   ```
   ```bash
   umask 077
   "$(uv tool dir)/google-colab-cli/bin/python" - <<'EOF' > colab-token.json
   import json, os, keyring
   try:
       raw = keyring.get_password("google-colab-cli", "oauth_token")
   except Exception:
       raw = None
   raw = raw or open(os.path.expanduser("~/.config/colab-cli/token.json")).read()
   d = json.loads(raw); d["type"] = "authorized_user"
   print(json.dumps(d))
   EOF
   ```
2. **Cloud environment settings** (session title bar → environment menu → Edit):
   - Environment variables: `COLAB_TOKEN_JSON=<the one-line contents of colab-token.json>`, then delete the local file. Add `HF_TOKEN=...` if runs need it.
   - Allowed domains: `colab.research.google.com` and `*.prod.colab.dev`. Each Colab VM is reached at its own host (for example `8080-m-s-<id>-d.us-east1-0.prod.colab.dev`), known only after `colab new`, so it needs the suffix rule. `oauth2.googleapis.com` and `pypi.org` are reachable by default. If a run fails at the kernel or ssh connection with a proxy refusal, `curl -sS "$HTTPS_PROXY/__agentproxy/status"` names the blocked host. Add that host's suffix.
   - Setup script: add the line `if [ -d experiment-lab-test ]; then bash experiment-lab-test/scripts/cloud/setup.sh; fi`.
3. Start a new session and run `bash scripts/cloud/check.sh`.

The token can spend the account's compute units: treat it as a password. Anyone who can use the environment can read its variables, so keep the environment personal. To revoke the token: Google Account → Security → Third-party connections, then log in again and replace the variable.

## In Every Session

- `bash scripts/cloud/check.sh`. If anything is MISSING or FAIL, it is a setup failure (`AGENTS.md` §5 item 4): report it, never a result.
- Git: `uv run scripts/lab.py sync-repos`, `new-exp`, `mount-exp`, `git push origin exp/<exp-name>`. The session's git proxy supplies credentials. It refuses branch deletes and tag pushes, so never push a branch you would want to delete.
- Colab: as in the `colab-cli` skill, minus its Headless-and-Cloud setup, which the wrapper already does. Always `-s <name>`, a teardown trap, smoke-test on `T4`. Only public, de-identified data goes to Colab (`AGENTS.md` §5 item 11).
- Subagents run in the same container, so they get the same wrapper, variables, network and git credentials. Give them the experiment's worktree path. They do not inherit your `cd` or shell variables.

## Known Behaviour of `google-colab-cli` 0.8.0

- `colab sessions` exits 0 even when it cannot log in. `whoami`, `usage` and `new` exit 1. Check with `whoami` or `usage`.
- With no `COLAB_TOKEN_JSON`, the wrapper is plain `colab`, so the same commands work on a laptop with its own login.

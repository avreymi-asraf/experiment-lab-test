#!/usr/bin/env bash
# Is this machine ready to run the lab in the cloud? One line per item, OK / MISSING / FAIL; never prints a secret.
# Read-only except `colab whoami`/`colab sessions` (no VM is created). Exit 1 if anything needed failed.
# Run it at the start of any session or subagent that will rent Colab or push branches.
cd "$(dirname "${BASH_SOURCE[0]}")/../.."
fail=0
ok()   { printf 'OK       %s\n' "$*"; }
bad()  { printf 'FAIL     %s\n' "$*"; fail=1; }
miss() { printf 'MISSING  %s\n' "$*"; fail=1; }

[ "${CLAUDE_CODE_REMOTE:-}" = true ] && ok "Claude Code cloud session (${CLAUDE_CODE_REMOTE_ENVIRONMENT_TYPE:-?})" || ok "not a Claude Code cloud session"
command -v uv  >/dev/null && ok "uv $(uv --version | cut -d' ' -f2)" || miss "uv"
command -v ssh >/dev/null && ok "ssh client" || miss "ssh client (run scripts/cloud/setup.sh)"
case "$(command -v colab)" in
  /usr/local/bin/colab) ok "colab wrapper on PATH" ;;
  "") miss "colab (run scripts/cloud/setup.sh)" ;;
  *) bad "colab on PATH is $(command -v colab), not the wrapper: subprocesses would miss the cloud login" ;;
esac

# Git: every target repo in repos.yaml must be readable, and pushes go through the same proxy credentials.
for url in $(grep -E '^\s*url:' repos.yaml | awk '{print $2}'); do
  git ls-remote --exit-code -h "$url" >/dev/null 2>&1 && ok "git read $url" || bad "git read $url (repo not attached to this session or no access)"
done

# Colab login and network.
if [ -z "${COLAB_TOKEN_JSON:-}" ]; then
  miss "COLAB_TOKEN_JSON env var (see scripts/cloud/README.md: one-time export from your own machine)"
elif out=$(colab whoami 2>&1); then
  ok "colab login: $(printf '%s\n' "$out" | grep -iE 'email|account' | head -1 | sed 's/^ *//')"
  # `colab sessions` exits 0 even when it cannot authenticate; `colab usage` does not.
  if colab usage >/dev/null 2>&1; then ok "colab API reachable (colab usage)"; else bad "colab usage failed: network to colab.research.google.com, or the account has no Colab access"; fi
else
  bad "colab whoami: $(printf '%s\n' "$out" | tail -1)"
fi
for host in colab.research.google.com oauth2.googleapis.com; do
  code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 10 "https://$host/" || true)
  [ "$code" != 000 ] && ok "network $host" || bad "network $host blocked (add it to the environment's allowed domains)"
done
# Runtime hosts are per VM (e.g. <id>.<region>.prod.colab.dev) and only known after `colab new`: they need
# the suffix rule *.prod.colab.dev in the environment's allowed domains, and are checked by a real run, not here.
exit $fail

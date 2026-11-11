#!/usr/bin/env bash
# One-time machine setup for a cloud session (Claude Code cloud environment's setup script, CI, a fresh VM).
# Runs as root, before the agent starts, and must not need any secret: the cloud setup script cannot see the
# environment's variables. Idempotent. Logins come later, at call time (scripts/cloud/colab).
#
#   Environment setup script line:  if [ -d experiment-lab-test ]; then bash experiment-lab-test/scripts/cloud/setup.sh; fi
#   Check afterwards:               bash scripts/cloud/check.sh
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COLAB_CLI_VERSION="${COLAB_CLI_VERSION:-0.8.0}"   # the version the colab-cli skill was checked against; bump deliberately
export PATH="$HOME/.local/bin:$PATH"

# 1. ssh client, for `colab ssh` (tar streams, background training launches).
if ! command -v ssh >/dev/null; then
  apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq openssh-client >/dev/null
fi

# 2. uv (normally preinstalled in Claude Code cloud images).
command -v uv >/dev/null || curl -LsSf https://astral.sh/uv/install.sh | sh

# 3. Colab CLI in its own tool dir, so the only `colab` on PATH is the wrapper below.
UV_TOOL_DIR=/opt/colab-cli/tool UV_TOOL_BIN_DIR=/opt/colab-cli/bin \
  uv tool install -q "google-colab-cli==$COLAB_CLI_VERSION"
install -m 755 "$here/colab" /usr/local/bin/colab
rm -f "$HOME/.local/bin/colab"   # an older plain install would shadow the wrapper (~/.local/bin is earlier on PATH)

echo "[setup] ssh $(ssh -V 2>&1 | cut -d, -f1), colab $(/opt/colab-cli/bin/colab version 2>/dev/null | tail -1), wrapper at /usr/local/bin/colab"

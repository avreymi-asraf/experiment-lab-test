---
type: claim
status: confirmed
verified: pass
created: 2026-11-11
description: cloud session without credentials cannot reach the OncoLens-data repo, Hugging Face, or colab; default Qwen model cannot load
---
# In a cloud session with no credentials and a restricted egress proxy, the real data sample (`OncoLens-data`) and the default base model (`Qwen/Qwen2.5-0.5B-Instruct` from Hugging Face) cannot be fetched, so `explorer.train` with its default config fails at model load; this is an environment limit, not a property of the code.

## Evidence
- experiment::`00-explorer-connectivity/cloud-cpu` round 1 @ `48ecfea` — anonymous `git clone` of the data repo ended `could not read Username for 'https://github.com'`; `huggingface.co` got `403 CONNECT tunnel failed` from the proxy; `explorer.train` with the default model ended `OSError: Can't load the configuration of 'Qwen/Qwen2.5-0.5B-Instruct'`; `colab` was not installed. Files: `notes/00-explorer-connectivity/cloud-cpu/runs/01-probe/`, `runs/02-default-model/` on the branch (local only).

## Conditions
One Claude Code cloud session on 2026-11-11, no `.env`, no `DATA_DIR`, no `HF_TOKEN`, outbound HTTPS through the session's egress proxy where PyPI is reachable and `huggingface.co` is not. It was not tested whether a token for the data repo, or an allowed Hugging Face host, would work. A different session or environment setting may differ. Technical blockers, not a result about any idea.

## Relations

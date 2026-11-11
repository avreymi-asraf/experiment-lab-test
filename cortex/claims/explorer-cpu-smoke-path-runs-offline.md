---
type: claim
status: confirmed
verified: pass
created: 2026-11-11
description: oncolens-explorer guard check and train smoke run on CPU without GPU, Colab, network or credentials, synthetic sample, local tiny model
---
# On `oncolens-explorer`, the connection check and `explorer.train` run to completion on CPU with no GPU, Colab, network or credentials, provided the sample and the model are local (a synthetic sample and a locally built tiny model work).

## Evidence
- experiment::`00-explorer-connectivity/cloud-cpu` round 2 and 3 @ `48ecfea` — `explorer.check` printed 6 of 6 PASS (exit 0) and `explorer.train` (unmodified, 30 steps, batch 4) wrote a complete run folder with finite loss in under 2 s of training on 4 CPU cores; run files in `notes/00-explorer-connectivity/cloud-cpu/runs/03-train-tiny-cpu/` on the branch (the branch exists only in the local clone: pushing it was refused, see the log).

## Conditions
Target `oncolens-explorer`, code of branch `exp/01-explorer-init/connectivity` at `447c235` plus `explorer/synth.py`. Data: synthetic sample from `explorer.synth.make_sample` (60 invented patients, schema assumed from what `data.py` reads, not from the real files). Model: random-weight 2-layer GPT-2 (about 1M parameters) with a BPE tokenizer trained on the synthetic records, passed as `RunConfig.model_id`. Torch from `uv sync --extra train` (PyPI reachable). No evaluation version (no `evaluate.py`). The result says the code path runs; it says nothing about the real sample's content, Qwen2.5-0.5B on CPU, or the Colab runner.

## Relations

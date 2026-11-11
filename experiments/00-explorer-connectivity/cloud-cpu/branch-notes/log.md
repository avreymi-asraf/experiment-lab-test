# Experiment Log: `00-explorer-connectivity/cloud-cpu`

* **Target Repo:** `oncolens-explorer` (branch `exp/00-explorer-connectivity/cloud-cpu`, base `exp/01-explorer-init/connectivity` at `447c235`)
* **Opened:** `2026-11-11 13:08`

> The experiment's own working memory. Append-only, one entry per round, newest last.

## Round 1 · 2026-11-11 · probe-environment
* **Tried:** No code. Ran the connectivity pieces as an agent in a fresh cloud session finds them.
* **Run plan:** Question: which pieces need something this session lacks? Watch: the real sample (`DATA_DIR`, data repo clone), `colab` CLI, Hugging Face reachability, `.env`. Stop early: nothing; all are one-second commands.
* **Saw:** `runs/01-probe/probe.txt`. No `.env`, no `DATA_DIR`, no `HF_TOKEN`. `git clone https://github.com/avreymi-asraf/OncoLens-data.git` -> `fatal: could not read Username for 'https://github.com': terminal prompts disabled` (data repo not reachable anonymously; private or absent). `colab` not installed. `huggingface.co` -> proxy `403 CONNECT tunnel failed` (host not allowed in this session). `explorer.check --data /nonexistent` exits 1 with a `FileNotFoundError` traceback (loud, but not a FAIL line). Also (run `02-default-model/stderr.txt`): `explorer.train` with the default `Qwen/Qwen2.5-0.5B-Instruct` and a 1-step cap -> `OSError: Can't load the configuration of 'Qwen/Qwen2.5-0.5B-Instruct'` (cause: blocked host, not the code).
* **Decided:** All of these are environment blockers (INFRA), not results about the idea or the code. The real sample and the default model cannot be tested here. The pieces that can be tested need a credential-free fixture: round 2 adds one.
* **Told the lab:** Candidate (environment fact) — decided at close.

## Round 2 · 2026-11-11 · synthetic-sample-guard
* **Tried:** `explorer/synth.py`: `make_sample` (schema-faithful CSVs + manifest, invented values, stdlib) and `make_tiny_model` (random 2-layer GPT-2, BPE tokenizer trained on the synthetic records, saved locally). Schema assumed from what `data.py` and `check.py` read; the real column set of `timeline_events` and `mutations` beyond `patientId`/`gene` is NOT known here.
* **Run plan:** Question: does the guard pass on a schema-faithful sample with no network? Watch: six PASS lines, exit 0.
* **Saw:** `uv run python -m explorer.synth --out <dir>` then `explorer.check`: 6 of 6 PASS, 60 patients / 89 samples / 143 events / 123 mutations, split 54/6 disjoint, exit 0. No network used.
* **Decided:** Guard connectivity (code path) verified on synthetic data. It says nothing about the real sample's content.
* **Told the lab:** Candidate.

## Round 3 · 2026-11-11 · train-tiny-cpu
* **Tried:** `explorer.train` unmodified, `--model-id <local tiny model dir> --max-steps 30`, batch 4, on 4 CPU cores. Torch from `uv sync --extra train` (PyPI reachable; download of CUDA-flavoured wheels was the slow part, a few minutes).
* **Run plan:** Question: does `train()` run end to end on CPU and write the run folder? Watch: finite loss, `run.json` + `metrics.jsonl`. Stop: if over 10 minutes.
* **Saw:** `runs/03-train-tiny-cpu/`. Exit 0 in under 2 s of training (~8k tokens/s). Loss 6.24 -> 5.64, eval loss 6.24 -> 5.56, `train_loss_finite` true, run folder complete. The fall in loss shows the optimizer moves a random tiny model on invented text; it is not a quality result.
* **Decided:** Stopping point reached: every piece has a recorded outcome. Close. The Colab runner (`colab_run.py`) was not run (no Colab); the real sample and the Qwen download remain untested here.
* **Told the lab:** Claims `cortex/claims/explorer-cpu-smoke-path-runs-offline` and `cortex/claims/explorer-cloud-session-blocks-real-sample-and-hf` (provisional, then confirmed at close).

## Close · 2026-11-11
* No `evaluate.py` in the repo: closed with `patch.diff` and no number. Verdict HYPOTHESIS_SUPPORTED for the code path (synthetic sample, local tiny model); real sample, Qwen and the Colab runner untested (blocked). Claims confirmed. Push of this branch to the target was refused by the git proxy (`avreymi-asraf/OncoLens-explorer is not in this session's authorized repository set`); the branch is local only. Postmortem: `experiments/00-explorer-connectivity/cloud-cpu/` in the lab.

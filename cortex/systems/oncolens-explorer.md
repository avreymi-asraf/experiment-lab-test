---
type: system
anchor: code
repo: oncolens-explorer
status: fresh
updated: 2026-11-11
---
# System Profile: `oncolens-explorer`

> Repo: https://github.com/avreymi-asraf/OncoLens-explorer | Fingerprint: git:447c235 (branch `exp/01-explorer-init/connectivity`); `main` is at 21f4acf and holds only a README and `pyproject.toml`
> Branch: exp/01-explorer-init/connectivity
> Monitored: explorer/, pyproject.toml, README.md

## 1. Overview
Target repo for the research: train a small model on cancer-patient data and extract **RECIST** data and the **stage** from it. Data creation and storage live in the separate `OncoLens-data` repo; this repo only reads a data *sample* folder from there, and never copies it into git.

- **RECIST** (Response Evaluation Criteria In Solid Tumors): how a solid tumor responds to treatment. Fields wanted (user: "all"): overall response (CR/PR/SD/PD), target lesion measurements and their sum, new lesions.
- **Stage:** how far the cancer has spread at a point in time, usually at first diagnosis. Wanted (user: "both"): TNM and the stage group, with the point in time.

**State found on 2026-11-11.** Experiment `01-explorer-init/connectivity` already exists on its branch (not created through this lab, so it has no `experiments/` folder here and no `notes/`). It connects the pipeline end to end: data sample -> text records -> a short fine-tune of `Qwen/Qwen2.5-0.5B-Instruct` on a Colab GPU -> run folder. It does **not** extract RECIST or stage yet: the model is trained to continue patient text (language-model loss), and the sample is a public structured study (`msk_chord_2024`: four CSV tables `patients`, `samples`, `timeline_events`, `mutations`, plus `manifest.json`), not free-text clinical documents. The last commit records that batch size 8 ran out of memory on a T4 (16 GB), so batch size is 4.

## 2. Experiment Language (Shared by Every Experiment on This Repo)
> Every experiment is a small change on top of this section. Change it only when that is the idea of an experiment.

* **Mental model:** a *run* is `(data sample, RunConfig)` -> a run folder. An idea changes the config, the record rendering or the training step; the data seam, the split and the runner stay as they are.
* **Vocabulary:** *sample* (a folder of the four tables plus manifest), *record* (one patient as text), *seam* (a place where one tool hands data to the next, checked by `check.py`), *run folder* (`run.json`, `metrics.jsonl`, `train.log`).

### Shared components
| Component | Where | What it does | Notes |
|---|---|---|---|
| Data | `explorer/data.py` | `load_tables` -> `profile` (aggregates only) -> `render_records` (one text record per patient) -> `split_records` (patient-disjoint) -> `text_length_stats` | Standard library only. Ids never enter record text. |
| Connection check (the guard) | `explorer/check.py` | One PASS/FAIL line per data seam on the real sample; no GPU, no network | Exit code 1 on any failure. |
| Run entry and config | `explorer/train.py` | `RunConfig` (model, steps, batch size, learning rate, max length, split, seed) and `train()`; writes the run folder | Needs the `train` extra (torch, transformers). |
| Runner | `explorer/colab_run.py` | Ships `git archive HEAD` and the sample to a Colab GPU, trains detached, polls, downloads the run folder, always stops the session | Uses the `colab` CLI. Last stdout line is a JSON summary. Code must be committed before it runs. |
| Observation and analysis | none yet | | Missing: something to compare runs. |
| Final evaluation | none yet (`evaluate.py` absent) | | Missing: scores for stage and RECIST fields. |

### Extension points
* **Record rendering** (`render_records` in `explorer/data.py`): what a patient looks like as text. Ideas about the input format go here.
* **`RunConfig`** (`explorer/train.py`): model, optimizer and length settings. Variants are config values.
* **Training step** (`train()`): the loss and what the model is asked to produce. Not yet a task: an extraction task (output = stage and RECIST as JSON) is the first thing that does not fit and needs its own place.

### What a run leaves behind
A run folder with `run.json` (config, environment, data profile, summary), `metrics.jsonl` (one line per train step and per eval) and `train.log`.

### Commands
```bash
uv run python -m explorer.check --data $DATA_DIR/<sample>
uv run python -m explorer.colab_run --data $DATA_DIR/<sample> --out $EXP_DIR/run --gpu T4 -- --max-steps 30
```
Through the lab: `uv run scripts/lab.py run --exp <id> -- '<command>'`.

### Data
`<data repo>@<ref>:data/samples/msk_chord_2024` from `OncoLens-data` (public, de-identified, carries a licence in `manifest.json`). `DATA_DIR` in `.env` points at a local copy.
Rules already in the code and kept: only public, de-identified samples go to Colab; nothing prints an individual patient row (`profile` returns counts only). Real patient documents never go to Colab or any outside service until the user says so (`AGENTS.md` §5 item 11).

## 3. Checks & Measurements
- `explorer.check`: seam checks (manifest counts, every row links to a patient, one record per patient, no id in text, patient-disjoint split).
- Held-out loss (`eval_loss`) is the only measurement. It is not a measurement of RECIST or stage extraction.

## 4. Known Quirks & Environment Notes
- Batch size 8 runs out of memory on a T4 with full fine-tuning; use 4 or checkpoint gradients.
- `colab_run` ships `git archive HEAD`: uncommitted training code is not sent.
- The branch name `exp/01-explorer-init/connectivity` follows the lab's naming (`<id>-<short>-<name>` with short name `explorer`), but the lab has no folder for it yet.
- In a cloud session with no credentials, `OncoLens-data` and `huggingface.co` are unreachable and `colab` is absent; the guard and `train` still run on CPU with a synthetic sample and a local tiny model (see `[[findings/cloud-session-connectivity]]`; fixtures in `explorer/synth.py` on `exp/00-explorer-connectivity/cloud-cpu`, not yet a shared component of the base branch).
- `.gitignore` in the target ignores `runs/`, which also matches `notes/<exp-name>/runs/`; add run files with `git add -f`.

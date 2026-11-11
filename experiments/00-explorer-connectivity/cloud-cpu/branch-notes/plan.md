---
exp_name: 00-explorer-connectivity/cloud-cpu
title: "Cloud CPU connectivity check"
date: 2026-11-11
target_repo: oncolens-explorer
base_branch: exp/01-explorer-init/connectivity
exp_branch: exp/00-explorer-connectivity/cloud-cpu
linked_gaps: []      # none: this is plumbing, G-01 is the research question it only prepares for
inspired_by: []
data_source: "OncoLens-data@main:data/samples/msk_chord_2024"  # real sample: NOT reachable from a cloud session (log round 1). Rounds 2-3 used a synthetic sample from explorer/synth.py
---
# Plan: `00-explorer-connectivity/cloud-cpu` — Cloud CPU connectivity check

> Current best description of how to realise the idea. Rewritten in place; history is in `log.md`.

## 1. The Idea
* **Idea:** Verify that the pipeline's connectivity pieces (data seam check, `RunConfig` -> `train()` -> run folder) actually run in a cloud session, without Colab and without credentials, on CPU.
* **Why it is worth trying:** Every later experiment on this repo (SPARK-01, SPARK-02, G-01) assumes an agent in a cloud session can run the guard and a smoke run. Experiment `01-explorer-init/connectivity` only ever ran on Colab with the real sample. Nobody has seen what works without those.
* **Crossed with what the lab knows:** The cortex holds no claims, findings, tensions or Banlist entries yet. The system page (code-anchored, not a claim) says the guard needs "no GPU, no network" and `train.py` "runs slowly on CPU"; both are statements from the code's docstrings, not seen by the lab. Purpose §3 (how results are judged) is not written, so no metric is claimed; the measure used here is pass/fail of each connectivity piece.
* **Alternatives considered:** Building `evaluate.py` and the extraction task (SPARK-01) first: bigger, and it would run on top of an unverified environment. A prompted-LLM baseline (SPARK-02): needs an API and document text, the data rules forbid third-party upload.

## 2. What We Know and How We Will Do It
Rounds:
1. Run the guard (`explorer.check`) and probe the environment as an agent finds it (no `DATA_DIR`, no `.env`, no colab, HF reachability). Expected: the real sample is the first thing to be missing.
2. Add a synthetic sample generator as a shared component (`explorer/synth.py`, stdlib only, same schema as the real sample, invented values) and run the guard on it.
3. Run `explorer.train` on CPU for a few steps on the synthetic sample with the smallest model that downloads, capped at about 10 minutes.

* **Experiment Language** (`cortex/systems/oncolens-explorer.md`):
  * **Extension point:** none of the three; the only addition is a fixture generator beside the data tools.
  * **Shared components used as they are:** `explorer/check.py`, `explorer/data.py`, `explorer/train.py` (`RunConfig` values only).
  * **What stays fixed:** all the code under test.
  * **Added to the shared set:** `explorer/synth.py` — synthetic sample with the real schema, so the guard and a smoke run work with no data repo access. Every later experiment gets a credential-free fixture.

## 3. Open Questions
* Is the real sample reachable from a cloud session? (round 1)
* Does the guard pass on a schema-faithful sample? (round 2)
* Does `train()` run to a summary on CPU, and with which model and how long? (round 3)

## 4. Stopping Point
Enough: each connectivity piece has a recorded pass/fail from a real run, with the blockers named. Not worth continuing: more than three rounds, or a blocker that is the same each round (then conclude INFRA_INCONCLUSIVE for that piece). The Colab runner is not tested (Colab unavailable); that is out of scope, not a result.

---
type: finding
topic: cloud-session-connectivity
status: developing
updated: 2026-11-11
---
# Finding: What can an experiment on `oncolens-explorer` run in a cloud session with no Colab and no credentials?

> **Rests on:** experiment claims (one experiment, one session, one day).

## What We Know
The code path runs on CPU with nothing from outside: the connection check passes on a synthetic sample and `explorer.train` completes with a locally built tiny model ([[claims/explorer-cpu-smoke-path-runs-offline]]). The things that do not run are the ones that need an outside host: the real data sample in `OncoLens-data`, and the default `Qwen/Qwen2.5-0.5B-Instruct` from Hugging Face ([[claims/explorer-cloud-session-blocks-real-sample-and-hf]]).

## What It Means for the Next Experiment
Inference: an experiment that must be tested in a cloud session before it goes to Colab can use `explorer/synth.py` (branch `exp/00-explorer-connectivity/cloud-cpu`, not yet pushed) for a no-credential smoke run, but anything about content (record text, token lengths, stage or RECIST) needs the real sample and cannot be judged from the synthetic one. Plan the data and model source before the experiment, not at its first run.

## Where It Stops Holding
One session's network policy. The synthetic schema beyond `patientId` and `gene` is assumed. The Colab runner, the real sample and Qwen on CPU were not run. Loss on the tiny random model is plumbing evidence only.

## Open
* Whether a credential for `OncoLens-data` or an allowed Hugging Face host makes the full path run in a cloud session (not tested).

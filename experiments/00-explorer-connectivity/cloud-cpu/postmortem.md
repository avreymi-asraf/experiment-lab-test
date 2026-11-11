# Postmortem: `00-explorer-connectivity/cloud-cpu`

* **Verdict:** `HYPOTHESIS_SUPPORTED` for the code path (on synthetic data and a local tiny model); the real sample, the default model and the Colab runner were blocked by the environment and are untested (technical blockers, not results).
* **Plan and log:** `notes/00-explorer-connectivity/cloud-cpu/` on branch `exp/00-explorer-connectivity/cloud-cpu` of `oncolens-explorer`, at commit `48ecfea` (branch head with the closing log entry: `88f51fc`). The branch exists only in the local clone: `git push` was refused (`remote: access denied by the git proxy: avreymi-asraf/OncoLens-explorer is not in this session's authorized repository set`). `patch.diff` here holds the code change.
* **Branch:** Not kept, because it is not pushed, so no later experiment could start from it; `explorer/synth.py` is a shared component that should be kept once the branch can be pushed (Spark below). The system page's `> Branch:` line is unchanged.

## 1. The Final Conclusion
* **What we conclude about the idea:** In a cloud session without Colab or credentials, the connection check and the training entry point run on CPU if the sample and model are local. The real sample and the default model cannot be reached in such a session, so the unmodified default path fails at model load.
* **Why we stopped here:** Plan's stopping point: each piece has a recorded outcome in three rounds.
* **Final evaluation:** The repo has no `evaluate.py`; no number, no evaluation version. No Frontier change.

## 2. Why It Went This Way
Round 1 found the blockers (data repo asks for a username, Hugging Face is refused by the proxy, no `colab`). Rounds 2 and 3 removed them with a synthetic sample and a locally built model, with no change to `check.py`, `data.py` or `train.py`. Caveat: the synthetic schema is assumed from what the code reads, so passing the guard says the code path works, not that the real sample passes.

## 3. What Went Into the Cortex and the Journal
* **Claims from this experiment:** `explorer-cpu-smoke-path-runs-offline` (confirmed), `explorer-cloud-session-blocks-real-sample-and-hf` (confirmed; an environment fact of one session, conditions stated).
* **Experiment Language:** added `explorer/synth.py` (`make_sample`, `make_tiny_model`); not in the system page's component table because the branch is not kept. Environment notes were added to the system page's Known Quirks. `patch.diff` reads as the fixture and nothing else.
* **Other cortex changes:** `findings/cloud-session-connectivity.md`, `index.md`.
* **Anti-Repeat Banlist entry:** none (nothing refuted).

## 4. Sparks
* **[SPARK-03]:** Push `exp/00-explorer-connectivity/cloud-cpu` from a session with write access, keep it, and move `explorer/synth.py` into the system page's components, so every experiment has a no-credential smoke fixture.
* **[SPARK-04]:** Run the same path with a credential for `OncoLens-data` and an allowed Hugging Face host to see whether the full Qwen-on-real-sample path runs in a cloud session.

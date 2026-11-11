# Lab Journal (`JOURNAL.md`)

> The lab's routing page: the best verified baselines, the ideas waiting to be tried (Sparks), the index of all experiments, open and closed, and the Anti-Repeat Banlist of refuted ideas. Terms: `AGENTS.md` §2.

## 1. Current Frontier (Best Verified Baselines)

> One baseline per target repo and task, shared by all experiments. A number is written with the evaluation version it was measured with (`evaluation_version` from that experiment's `results.json`).

| Target Repo | Task / Benchmark | Best Branch / Commit | Metric | Evaluation Version | Provenance Experiment |
| :--- | :--- | :--- | :--- | :--- | :--- |

## 2. Active Sparks (Ideas Waiting to Be Tried)

> `* **[SPARK-nn] (from [[<exp-name>]], a claim from outside, or the user; Priority; Gap):** the idea, and why it is worth an experiment.`

* **[SPARK-01] (from the user; Priority: high; Gap: G-01):** The pipeline is already connected on `oncolens-explorer` (branch `exp/01-explorer-init/connectivity`: data tools, connection check, short fine-tune, Colab runner), but nothing extracts anything yet: the model only learns to continue patient text. Open the first lab experiment from that branch (`new-exp --base-branch exp/01-explorer-init/connectivity`): add `evaluate.py` (per-field scores for stage and RECIST), a run viewer, and make the model output stage and RECIST as JSON.
* **[SPARK-02] (from the user; Priority: medium; Gap: G-01):** Baseline: a prompted general LLM (no training) on stage and RECIST extraction, to know what the small trained model has to beat.
* **[SPARK-03] (from [[00-explorer-connectivity/cloud-cpu]]; Priority: medium; Gap: none):** Push the experiment's branch from a session with write access, keep it, and register `explorer/synth.py` (synthetic sample and tiny local model) as a shared component, so every experiment has a no-credential smoke fixture.
* **[SPARK-04] (from [[00-explorer-connectivity/cloud-cpu]]; Priority: low; Gap: G-01):** Run the full path (real sample, Qwen) in a cloud session with a credential for `OncoLens-data` and an allowed Hugging Face host.

## 3. Experiment Matrix (Chronological Index)

> One row per experiment, written by `scripts/lab.py`: `new-exp` adds it with **OPEN** in the Verdict column, `record-verdict` completes it. A row that says OPEN is an experiment someone may be working on.

| Exp | Opened | Closed | Target Repo (`Branch`) | Idea | Metric vs. Baseline | Verdict | One-Line Takeaway |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `[[00-explorer-connectivity/cloud-cpu]]` | 2026-11-11 | 2026-11-11 | `oncolens-explorer` (`exp/00-explorer-connectivity/cloud-cpu`) | Cloud CPU connectivity check | `no metric` | **HYPOTHESIS_SUPPORTED** | Guard and train smoke run work on CPU offline with synthetic sample and local tiny model; real sample and HF model unreachable in a cloud session |

## 4. Anti-Repeat Banlist

> An idea that ran cleanly and did not work (`HYPOTHESIS_REFUTED`): `[pattern] -> [why it failed] -> [unless condition X changes] ([[claims/<claim>]])`. The claim is the experiment's final conclusion. A crash is never listed here, and neither is something only a paper reports.

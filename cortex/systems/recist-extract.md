---
type: system
anchor: code
repo: recist-extract
status: stub
updated: 2026-11-11
---
# System Profile: `recist-extract`

> Repo: not created yet (not in `repos.yaml`; a placeholder entry is skipped by `sync-repos`) | Fingerprint: none
> Monitored: none

## 1. Overview
Planned target for the first step of the research: extract **RECIST** data and the **stage** from medical documents of cancer patients, with a small trained model.

- **RECIST** (Response Evaluation Criteria In Solid Tumors): how a solid tumor responds to treatment, from imaging reports comparing lesion sizes over time. Typical fields: target lesion measurements and their sum, new lesions, overall response (CR, PR, SD, PD).
- **Stage:** how far the cancer has spread at a point in time, usually at first diagnosis (e.g. TNM and the stage group). Note that the same document can mention the stage at diagnosis and a later one; the point in time is part of what is extracted.

## 2. Experiment Language (Shared by Every Experiment on This Repo)
Not written yet. The first experiment on this target has one job: connect the pipeline end to end (documents in, one short run on Colab, results back, a way to watch a run) and write this section from what it built. Its claim is narrow ("the pipeline is connected") and its numbers are not a baseline.

Candidate shared components to build there: data loader and split (by patient, never by document), run config, Colab runner (`colab-cli` skill), run viewer (`notebook-observability` skill), `evaluate.py` (field-level scores for stage and RECIST).

### Data
Not written yet. Patient documents are sensitive: see `AGENTS.md` §5 item 11.

## 3. Checks & Measurements
Not written yet.

## 4. Known Quirks & Environment Notes
Not written yet.

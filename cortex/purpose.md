# Purpose (`purpose.md`)

## 1. What This Lab Is For
Train a small model and research it within one domain: documents about cancer patients. The first task is extracting **RECIST** (Response Evaluation Criteria In Solid Tumors) data from medical documents, and extracting the **stage** (disease staging: how far the cancer has spread through the body at a given time, typically at initial diagnosis). Target repo and data are not chosen yet (see "Open" below).

## 2. The Far Goal
Not written yet. The user has given the first step only (RECIST and stage extraction). An agent holding a wide task should say in its report which reading of the purpose it worked from.

## 3. How Results Are Judged
Not written yet. Open: the metric for each field (exact match on stage; RECIST category and lesion measurements against annotated documents), the labelled set to measure on, and how small the model must be. Until answered, an agent states the measure it used in its report.

## Open (to ask the user)
- Which documents (language, source, de-identified?) and whether any labelled set exists.
- Which target repo holds the model code (none registered yet in `repos.yaml`).
- Which RECIST outputs are wanted: overall response (CR/PR/SD/PD), target lesion sums, new lesions, or all.
- Which staging system (TNM, AJCC group, or both) and which cancer types.

# Purpose (`purpose.md`)

## 1. What This Lab Is For
Train a small model and research it within one domain: documents about cancer patients. The first task is extracting **RECIST** (Response Evaluation Criteria In Solid Tumors) data from medical documents, and extracting the **stage** (disease staging: how far the cancer has spread through the body at a given time, typically at initial diagnosis). Target repo: `oncolens-explorer`.

## 2. The Far Goal
Not written yet. The user has given the first step only (RECIST and stage extraction). An agent holding a wide task should say in its report which reading of the purpose it worked from.

## 3. How Results Are Judged
Not written yet. Open: the metric for each field (exact match on stage; RECIST category and lesion measurements against annotated documents), the labelled set to measure on, and how small the model must be. Until answered, an agent states the measure it used in its report.

## Stated by the user
- **Target repo:** `oncolens-explorer`. Data creation and storage live in `OncoLens-data`.
- **Documents:** "all" (every kind of document about cancer patients; language, source and de-identification not narrowed). The only sample in use so far is a public structured study (`msk_chord_2024`), not free-text documents.
- **RECIST outputs:** all (overall response, target lesion measurements and sum, new lesions).
- **Staging:** both TNM and stage group, with the point in time (at diagnosis or later). Cancer types: not narrowed.

## Still open
- Is there a labelled set (documents with known stage and RECIST values), and how big? The metric per field is decided when one exists.
- Which free-text documents, and may they go to Colab? Until the user says so, only public de-identified samples go there.

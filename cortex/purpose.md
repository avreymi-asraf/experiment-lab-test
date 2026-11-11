# Purpose (`purpose.md`)

## 1. What This Lab Is For
Train a small model and research it within one domain: documents about cancer patients. The first task is extracting **RECIST** (Response Evaluation Criteria In Solid Tumors) data from medical documents, and extracting the **stage** (disease staging: how far the cancer has spread through the body at a given time, typically at initial diagnosis). Target repo: `oncolens-explorer`.

## 2. The Far Goal
Not written yet. The user has given the first step only (RECIST and stage extraction). An agent holding a wide task should say in its report which reading of the purpose it worked from.

## 3. How Results Are Judged
Not written yet. Open: the metric for each field (exact match on stage; RECIST category and lesion measurements against annotated documents), the labelled set to measure on, and how small the model must be. Until answered, an agent states the measure it used in its report.

## Stated by the user
- Target repo: `oncolens-explorer`. Data creation and storage live in `OncoLens-data`.
- Documents: the user answered "all" (all languages, sources and kinds of document, labelled or not). Not narrowed further; treat which documents are actually available as open.
- RECIST outputs wanted: all (overall response, target lesion measurements and sum, new lesions).
- Staging: both TNM and stage group, and the point in time (at diagnosis or later).

## Answers given by the user (stated)
- Documents: "all" (every kind of document about cancer patients; language, source and de-identification not narrowed further). Raw data creation and storage live in the separate `OncoLens-data` repo.
- RECIST outputs: all (overall response, target lesion measurements and their sum, new lesions).
- Staging: both TNM and stage group. Cancer types: not narrowed ("both" was the answer to the staging question only).

## Still open
- Is there a labelled set, and how big? The metric per field is decided when one exists.
- Which cancer types come first.
- Are the documents de-identified, and may they go to Colab?

## Answers from the user (2026-11-11)
- Documents: "all" (the user did not narrow language, source or de-identification; ask again before any real patient text is used).
- RECIST outputs: all (overall response, target lesion measurements and sum, new lesions).
- Staging: both TNM and stage group. Cancer types: not narrowed.
- Target repo: `avreymi-asraf/OncoLens-explorer` (data creation and storage live in `OncoLens-data`).

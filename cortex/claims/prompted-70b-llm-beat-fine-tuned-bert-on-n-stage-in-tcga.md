---
type: claim
status: provisional
verified: pass
created: 2026-11-11
description: TCGA pathology reports N stage Med42-70B ZS-COT outperforms Clinical-BigBird, no labeled training data
---
# On N-category stage extraction from TCGA pathology reports, the best prompted 70B LLM (Med42-70B with zero-shot chain-of-thought) had significantly higher macro F1 than a fine-tuned Clinical-BigBird.

## Evidence
- quote::[[sources/chang-2024-open-source-llm-ptnm]] — IV-B
  > However, the best model in the N category, Med42-70B + ZS-COT, significantly outperforms Clinical Big Bird.

## Conditions
TCGA pathology reports (OCR text), 15% stratified test split, macro F1 with bootstrap t-test; Med42-70B is a 70B model, the baseline is the 128.1M-parameter Clinical-BigBird fine-tuned on the TCGA training split. A source's own result, not reproduced here.

## Relations
- contrasts_with::[[claims/fine-tuned-128m-bert-beat-best-prompted-70b-llm-on-t-stage-in-tcga]] — opposite result on a different field of the same paper (T versus N); not a disagreement between sources
<!-- verified: pass by blind check (cortex.py pairs, judged from its output alone by a separate verifier agent), 2026-11-11; stored quote confirmed against the fetched paper. -->

---
type: claim
status: provisional
verified: pass
created: 2026-11-11
description: TCGA pathology reports T stage Clinical-BigBird vs Med42-70B ZS-COT, small fine-tuned model vs large prompted LLM
---
# On T-category stage extraction from TCGA pathology reports, a fine-tuned 128M-parameter Clinical-BigBird had significantly higher macro F1 than the best prompted 70B LLM.

## Evidence
- quote::[[sources/chang-2024-open-source-llm-ptnm]] — IV-B
  > Our results show that Clinical Big Bird is significantly better than the best LLM, Med42-70B + ZS-COT, in the T category.

## Conditions
TCGA pathology reports (OCR text), 15% stratified test split, macro F1 with bootstrap t-test; Clinical-BigBird has 128.1M parameters and was fine-tuned on the TCGA training split; the LLMs were Llama-2-70b-chat, ClinicalCamel-70B and Med42-70B with no task training. A source's own result, not reproduced here.

## Relations
- contrasts_with::[[claims/prompted-70b-llm-beat-fine-tuned-bert-on-n-stage-in-tcga]] — opposite result on a different field of the same paper (T versus N); not a disagreement between sources
<!-- verified: pass by the writing agent's own re-read against the stored text, 2026-11-11. NOT a blind verification: no fresh agent could be spawned in this run. -->

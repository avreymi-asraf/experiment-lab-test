---
type: claim
status: provisional
verified: unchecked
created: 2026-11-11
description: whole-document accuracy RECIST lesion extraction all attributes correct report pairs error rate
---
# In the Dutch CT RECIST lesion-extraction study, qwen2.5-72b extracted every attribute correctly in only 62.0% of the 50 report pairs.

## Evidence
- quote::[[sources/builtjes-2026-longitudinal-recist-extraction]] — 3 Results
  > Each longitudinal report pair contained on average 30 total attributes; in 62.0% of pairs (95% CI: 52.2–70.9), all attributes were extracted without any errors.
- quote::[[sources/builtjes-2026-longitudinal-recist-extraction]] — Abstract
  > The system applies the qwen2.5-72b model to extract and link target, non-target, and new lesion data across time points in accordance with RECIST criteria. Evaluation on 50 Dutch CT Thorax/Abdomen report pairs yielded high extraction performance

## Conditions
Same setting as the 93.7%/94.9%/94.0% claim: 50 report pairs, one hospital, Dutch, qwen2.5-72b, no fine-tuning.

## Relations
- refines::[[claims/qwen2-5-72b-reached-94-percent-attribute-accuracy-on-recist-lesions-in-dutch-ct-report-pairs]] — same study, stricter unit (whole pair)
<!-- verified: partial in the blind check (model and language not shown in the first quote); abstract evidence item added, needs a fresh blind re-check. -->

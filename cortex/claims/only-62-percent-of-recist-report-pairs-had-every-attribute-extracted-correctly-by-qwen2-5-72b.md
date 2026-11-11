---
type: claim
status: provisional
verified: pass
created: 2026-11-11
description: whole-document accuracy RECIST lesion extraction all attributes correct report pairs error rate
---
# In the Dutch CT RECIST lesion-extraction study, qwen2.5-72b extracted every attribute correctly in only 62.0% of the 50 report pairs.

## Evidence
- quote::[[sources/builtjes-2026-longitudinal-recist-extraction]] — 3 Results
  > Each longitudinal report pair contained on average 30 total attributes; in 62.0% of pairs (95% CI: 52.2–70.9), all attributes were extracted without any errors.

## Conditions
Same setting as the 93.7%/94.9%/94.0% claim: 50 report pairs, one hospital, Dutch, qwen2.5-72b, no fine-tuning.

## Relations
- refines::[[claims/qwen2-5-72b-reached-94-percent-attribute-accuracy-on-recist-lesions-in-dutch-ct-report-pairs]] — same study, stricter unit (whole pair)
<!-- verified: pass by the writing agent's own re-read against the stored text, 2026-11-11. NOT a blind verification: no fresh agent could be spawned in this run. -->

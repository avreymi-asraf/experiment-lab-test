---
type: claim
status: provisional
verified: pass
created: 2026-11-11
description: RECIST target non-target new lesion extraction radiology reports open-source LLM accuracy longitudinal
---
# A locally run qwen2.5-72b pipeline extracted RECIST target, non-target and new lesion attributes from 50 Dutch CT report pairs with attribute-level accuracy of 93.7%, 94.9% and 94.0% respectively.

## Evidence
- quote::[[sources/builtjes-2026-longitudinal-recist-extraction]] — Abstract
  > Evaluation on 50 Dutch CT Thorax/Abdomen report pairs yielded high extraction performance, with attribute-level accuracies of 93.7% for target lesions, 94.9% for non-target lesions, and 94.0% for new lesions.

## Conditions
qwen2.5-72b (q4_K_M quantised), prompted with an in-context example, temperature 0, no fine-tuning; 50 test pairs from one hospital (Radboudumc), Dutch text; two readers judged label, size and series/image attributes. Extracts lesion data; the overall RECIST response category is not evaluated. A source's own result.

## Relations
- none yet
<!-- verified: pass by the writing agent's own re-read against the stored text, 2026-11-11. NOT a blind verification: no fresh agent could be spawned in this run. -->

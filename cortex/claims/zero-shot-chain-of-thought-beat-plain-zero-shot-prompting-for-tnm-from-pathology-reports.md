---
type: claim
status: provisional
verified: pass
created: 2026-11-11
description: prompting strategy chain of thought zero-shot few-shot TNM pathology Llama-2 Med42 ClinicalCamel
---
# In the TCGA pathology-report TNM comparison, zero-shot chain-of-thought prompting was judged better than plain zero-shot prompting for the three 70B LLMs.

## Evidence
- quote::[[sources/chang-2024-open-source-llm-ptnm]] — IV-B
  > As a result, we conclude that for this task, ZS-COT is a better prompting strategy than ZS.

## Conditions
TCGA pathology reports, T, N and M categories, Llama-2-70b-chat, ClinicalCamel-70B and Med42-70B, macro F1. The same paper reports that few-shot prompting was in most cases worse than zero-shot; the quoted conclusion is the authors'.

## Relations
- none yet
<!-- verified: pass by blind check (cortex.py pairs, judged from its output alone by a separate verifier agent), 2026-11-11; stored quote confirmed against the fetched paper. -->

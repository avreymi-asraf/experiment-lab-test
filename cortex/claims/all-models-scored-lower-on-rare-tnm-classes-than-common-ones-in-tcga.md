---
type: claim
status: provisional
verified: pass
created: 2026-11-11
description: rare class T4 N3 M1 macro F1 lower class imbalance TNM extraction
---
# In the TCGA pathology-report comparison, every model (three prompted 70B LLMs and a fine-tuned BERT) scored lower on the rare classes T4, N3 and M1 than on the common classes.

## Evidence
- quote::[[sources/chang-2024-open-source-llm-ptnm]] — IV-A
  > We also observe an interesting phenomenon: All models exhibit worse macro F1 scores for rare classes (i.e., T4, N3, and M1) than for common classes.

## Conditions
TCGA pathology reports, test split; models Clinical-BigBird, Llama-2-70b-chat, ClinicalCamel-70B, Med42-70B with zero-shot prompting. Class-level F1 as read from the paper's tables by the authors; the quoted sentence is theirs.

## Relations
- none yet
<!-- verified: pass by the writing agent's own re-read against the stored text, 2026-11-11. NOT a blind verification: no fresh agent could be spawned in this run. -->

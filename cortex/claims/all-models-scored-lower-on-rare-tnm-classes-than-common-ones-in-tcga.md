---
type: claim
status: superseded
verified: partial
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
- superseded_by::[[claims/all-models-scored-lower-on-rare-tnm-classes-than-common-ones-in-the-tcga-zero-shot-comparison]] — blind verification said partial: the quoted sentence sits in the zero-shot comparison section, which the sentence above omitted

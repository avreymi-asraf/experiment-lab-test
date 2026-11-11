---
type: claim
status: provisional
verified: unchecked
created: 2026-11-11
description: rare class T4 N3 M1 macro F1 lower class imbalance TNM extraction zero-shot
---
# In the TCGA pathology-report comparison with zero-shot prompting, every model (three 70B LLMs and the BERT-based Clinical-BigBird benchmark) scored lower on the rare classes T4, N3 and M1 than on the common classes.

## Evidence
- quote::[[sources/chang-2024-open-source-llm-ptnm]] — IV-A
  > We also observe an interesting phenomenon: All models exhibit worse macro F1 scores for rare classes (i.e., T4, N3, and M1) than for common classes.

## Conditions
TCGA pathology reports, test split; models Clinical-BigBird (128.1M parameters; the abstract says the BERT-based model was fine-tuned on the labelled data), Llama-2-70b-chat, ClinicalCamel-70B, Med42-70B with zero-shot prompting (the section the sentence is in). Macro F1 per class as reported by the authors. Whether it also holds for few-shot or chain-of-thought prompting is not shown by this quote.

## Relations
- none yet

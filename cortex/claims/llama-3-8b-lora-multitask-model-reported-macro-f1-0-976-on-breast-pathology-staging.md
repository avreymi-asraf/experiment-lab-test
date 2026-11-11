---
type: claim
status: provisional
verified: pass
created: 2026-11-11
description: Llama-3-8B LoRA fine-tuned classification heads TNM grade ER PR HER2 breast pathology reports macro F1 0.976 small model
---
# A Llama-3-8B-Instruct model fine-tuned with LoRA and parallel classification heads on 10,677 breast pathology reports is reported by its authors to reach a macro F1 of 0.976.

## Evidence
- quote::[[sources/shao-2026-multitask-lora-staging]] — Abstract
  > We fine-tune a Llama-3-8B-Instruct encoder using Low-Rank Adaptation (LoRA) on a curated, expert-verified dataset of 10,677 reports.
- quote::[[sources/shao-2026-multitask-lora-staging]] — Abstract
  > Experimental results demonstrate that the model achieves a Macro F1 score of 0.976

## Conditions
Breast cancer pathology reports only; seven output variables (T, N, M, grade, ER, PR, HER2); the 0.976 figure is from the abstract and the averaging and test split were not read in the retrieved text; labels came from regex bootstrapping with partial expert audit per the paper. Self-reported single preprint.

## Relations
- none yet
<!-- verified: pass by blind check (cortex.py pairs, judged from its output alone by a separate verifier agent), 2026-11-11; stored quote confirmed against the fetched paper. -->

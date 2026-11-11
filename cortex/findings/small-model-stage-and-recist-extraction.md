---
type: finding
topic: small-model-stage-and-recist-extraction
status: developing
updated: 2026-11-11
---
# Finding: How well do small models extract cancer stage and RECIST data from reports, and what does it take?

> **Rests on:** quoted claims only: nothing on this page was tested in this lab. "The literature reports" is the strongest sentence it can say. Three preprints, one of them read only in part.

## What We Know
- **Stage (TNM) from pathology text.** On TCGA pathology reports, prompted 70B models with no task training beat a fine-tuned 128M-parameter BERT on N and lost to it on T ([[claims/prompted-70b-llm-beat-fine-tuned-bert-on-n-stage-in-tcga]], [[claims/fine-tuned-128m-bert-beat-best-prompted-70b-llm-on-t-stage-in-tcga]]; provisional, one source). So "prompted large model" and "small fine-tuned model" were each better on a different field.
- **Rare classes are hard for everyone.** T4, N3 and M1 scored lower than common classes for all models in that comparison ([[claims/all-models-scored-lower-on-rare-tnm-classes-than-common-ones-in-tcga]]; provisional). The same paper says the corpus's M labels are partly inconsistent with the report text, which is a data-quality limit on any M score on this corpus.
- **Prompting.** Zero-shot chain-of-thought was judged better than plain zero-shot for the three 70B models there ([[claims/zero-shot-chain-of-thought-beat-plain-zero-shot-prompting-for-tnm-from-pathology-reports]]; provisional).
- **An 8B fine-tuned model.** One preprint reports a macro F1 of 0.976 for a LoRA-fine-tuned Llama-3-8B-Instruct with classification heads on 10,677 breast pathology reports ([[claims/llama-3-8b-lora-multitask-model-reported-macro-f1-0-976-on-breast-pathology-staging]]; provisional, self-reported, abstract only). This is the only "small model" evidence so far, and it is for stage and biomarkers in one cancer type, with about ten thousand labelled reports.
- **RECIST lesion data.** A prompted 72B model, with no fine-tuning, extracted lesion attributes with about 94% attribute-level accuracy on 50 Dutch CT report pairs ([[claims/qwen2-5-72b-reached-94-percent-attribute-accuracy-on-recist-lesions-in-dutch-ct-report-pairs]]), but only 62.0% of pairs had every attribute right ([[claims/only-62-percent-of-recist-report-pairs-had-every-attribute-extracted-correctly-by-qwen2-5-72b]]).

## What It Means for the Next Experiment
Inference: no source here tests a small model on RECIST, and none tests one on free-text stage outside pathology reports. The comparison worth running first is a fine-tuned small model against a prompted larger one on the same labelled documents, per field. Report whole-document correctness as well as per-attribute accuracy, since per-attribute figures looked far better than whole-pair correctness in the RECIST study. Do not treat any number here as a Frontier baseline or a Banlist entry: they are quotes, not our measurements.

## Where It Stops Holding
The 70B and 72B results say nothing about small models. All settings are English or Dutch hospital text, pathology or CT reports, not the lab's documents. Each result is one preprint's own scoring, with different metrics (macro F1, attribute accuracy), so numbers are not comparable across sources. The 0.976 figure is from the abstract; its test split and averaging were not read.

## Open
* G-01 in `gap_map.md`: whether a small model reaches useful levels on our documents, and the data it needs.
* Not yet read: the results and appendix of the 8B LoRA preprint; the overall response category (CR/PR/SD/PD) is not covered by any of the three sources.

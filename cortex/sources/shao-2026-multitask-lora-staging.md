---
type: source
kind: paper
origin: "Jiahao Shao, Anam Nawaz Khan, Christopher Brett, Tom Berg, Xueping Li, Bing Yao"
published: 2026-04-14
captured: 2026-11-11
location: "https://arxiv.org/abs/2604.13328"
read: partial (abstract, introduction, background and start of methods, about 20,000 characters; results, ablations and appendix not retrieved)
route: conversation, passages retyped by hand before `cortex.py store` existed; a later re-fetch found no changed words, not compared by script
reliability: primary
---
# Multi-Task LLM with LoRA Fine-Tuning for Automated Cancer Staging and Biomarker Extraction

**What it is and what it can establish:** Fine-tunes Llama-3-8B-Instruct with LoRA and parallel classification heads to read T, N, M, histologic grade and ER/PR/HER2 from breast pathology reports. It can establish what an 8B fine-tuned model reaches with about ten thousand labelled reports, as the authors report it.

**Limits:** Single preprint, breast cancer only, only the abstract-level result was read (no per-field scores), labels built by regex bootstrapping plus partial expert audit, no RECIST.

**Read for:** G-01.

## Text
Passages that claims quote: `sources/text/shao-2026-multitask-lora-staging.md`.

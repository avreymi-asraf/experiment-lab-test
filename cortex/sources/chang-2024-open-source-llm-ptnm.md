---
type: source
kind: paper
origin: "Chia-Hsuan Chang, Mary M. Lucas, Grace Lu-Yao, Christopher C. Yang (IEEE ICHI 2024)"
published: 2024-04-02
captured: 2026-11-11
location: "https://arxiv.org/abs/2404.01589"
read: partial (full text through the start of the Discussion; the rest of the Discussion and the conclusion were cut off in retrieval)
route: conversation, passages retyped by hand before `cortex.py store` existed; a later re-fetch found no changed words, not compared by script
reliability: primary
---
# Classifying Cancer Stage with Open-Source Clinical Large Language Models

**What it is and what it can establish:** Compares three 70B open-source LLMs (Llama-2-70b-chat, ClinicalCamel-70B, Med42-70B) used with zero-shot, zero-shot chain-of-thought and few-shot prompts against a fine-tuned 128M-parameter Clinical-BigBird, on extracting pathologic T, N and M categories from TCGA pathology reports. It can establish how prompted large models compare with a small fine-tuned encoder on TNM from free text.

**Limits:** One preprint, one corpus (TCGA, OCR text, labels with known M inconsistencies), macro F1 only, models are 70B (not small), no code-level detail read here.

**Read for:** G-01.

## Text
Passages that claims quote: `sources/text/chang-2024-open-source-llm-ptnm.md`.

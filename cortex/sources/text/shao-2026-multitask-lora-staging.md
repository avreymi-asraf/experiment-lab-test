# Multi-Task LLM with LoRA Fine-Tuning for Automated Cancer Staging and Biomarker Extraction (stored passages)

Retrieved 2026-11-11 from https://arxiv.org/pdf/2604.13328 (v1). The first 20,000 characters were read (abstract, introduction, background, start of methods); results sections were not retrieved. Only the passages that claims quote are stored here, under their section names.

## Abstract
Pathology reports serve as the definitive record for breast cancer staging, yet their unstructured format impedes large-scale data curation. This study introduces a parameter-efficient, multi-task framework for automating the extraction of Tumor-Node-Metastasis (TNM) staging, histologic grade, and biomarkers. We fine-tune a Llama-3-8B-Instruct encoder using Low-Rank Adaptation (LoRA) on a curated, expert-verified dataset of 10,677 reports. Unlike generative approaches, our architecture utilizes parallel classification heads to enforce consistent schema adherence. Experimental results demonstrate that the model achieves a Macro F1 score of 0.976, successfully resolving complex contextual ambiguities and heterogeneous reporting formats that challenge traditional extraction methods including rule-based natural language processing (NLP) pipelines, zero-shot LLMs, and single-task LLM baselines.

## III Research Methodology
T Stage (tumor size), N Stage (lymph node involvement), M Stage (distant metastasis), histologic grade (cell differentiation), and three biomarkers (ER, PR, and HER2).

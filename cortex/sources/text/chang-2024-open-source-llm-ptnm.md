# Classifying Cancer Stage with Open-Source Clinical Large Language Models (stored passages)

Retrieved 2026-11-11 from https://arxiv.org/abs/2404.01589 (v1, full-text rendering, read to the start of the Discussion). Only the passages that claims quote are stored here, under their section names.

## Abstract
In this study, we demonstrate that without any labeled training data, open-source clinical large language models (LLMs) can extract pathologic tumor-node-metastasis (pTNM) staging information from real-world pathology reports. Our experiments compare LLMs and a BERT-based model fine-tuned using the labeled data. Our findings suggest that while LLMs still exhibit subpar performance in Tumor (T) classification, with the appropriate adoption of prompting strategies, they can achieve comparable performance on Metastasis (M) classification and improved performance on Node (N) classification.

## III-A Dataset
This resulted in a dataset of 9,523 reports. A subset of 6,940 reports from this corpus having associated ground truth labels for the T, N, or M stage was then identified for TNM classification task. The reports were split into 85% training and 15% testing datasets, using stratified sampling to ensure the class distributions in T, N, and M were similar between datasets.

## III-B Benchmark
We employ Clinical-BigBird [15], which extends from the BERT architecture and has 128.1M parameters.

## III-C Large Language Model
We adopt three open-source LLMs, Llama-2-70b-chat, ClinicalCamel-70B, and Med42-70B, and evaluate their capabilities on cancer pTNM classification.

## IV-A Performance Comparison: Benchmark and LLMs with Zero-shot Prompting
We also observe an interesting phenomenon: All models exhibit worse macro F1 scores for rare classes (i.e., T4, N3, and M1) than for common classes.

## IV-B Performance Comparison: LLMs with Different Prompting Strategies
As a result, we conclude that for this task, ZS-COT is a better prompting strategy than ZS.

We observe mixed results when we use FS prompting. In most cases, the three LLMs have worse macro F1 compared with ZS performance.

Our results show that Clinical Big Bird is significantly better than the best LLM, Med42-70B + ZS-COT, in the T category. However, the best model in the N category, Med42-70B + ZS-COT, significantly outperforms Clinical Big Bird. The Med42-70B + FS, the best model for the M category, has a macro F1 comparable to Clinical-BigBird.

## IV-C Performance Comparison by Cancer Type
In curating and using this data corpus for TNM classification, Kefeli and Tatonetti [8] report several limitations regarding M01 classification, namely, that many of the pathology reports do not explicitly contain M0 or M1, unlike the case for T and N status, and that TCGA annotations of M01 are occasionally inconsistent with the report text.

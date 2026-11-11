# Tracking Cancer Through Text: Longitudinal Extraction From Radiology Reports Using Open-Source Large Language Models (stored passages)

Retrieved 2026-11-11 from https://arxiv.org/pdf/2603.09638 (v2, full text read). Only the passages that claims quote are stored here, under their section names.

## Abstract
The system applies the qwen2.5-72b model to extract and link target, non-target, and new lesion data across time points in accordance with RECIST criteria. Evaluation on 50 Dutch CT Thorax/Abdomen report pairs yielded high extraction performance, with attribute-level accuracies of 93.7% for target lesions, 94.9% for non-target lesions, and 94.0% for new lesions.

## 2.1 Dataset
The curated dataset was subsequently partitioned into two subsets: 10 pairs allocated as a debug set for prompt engineering and refinement, and 50 pairs reserved as the final test set for evaluation.

## 2.2 LLM_Extractinator
All inferences were conducted on two NVIDIA A100 GPUs (40 GB each) with the temperature parameter set to 0

## 3 Results
Across both readers, the pooled accuracy for complete TL extraction was 78.1% (95% CI: 72.5–83.0). At the attribute level, 93.7% (95% CI: 92.2–95.0) of TL attributes were correctly extracted, and 83.5% (95% CI: 77.4–88.2) of reports contained no TL extraction errors.

Each longitudinal report pair contained on average 30 total attributes; in 62.0% of pairs (95% CI: 52.2–70.9), all attributes were extracted without any errors.

## 4 Discussion
The distribution of target lesion errors was balanced, with 45% involving the size attribute and 55% the se_ima identifier.

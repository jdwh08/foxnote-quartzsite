---
aliases: 
tags:
  - ds/ml/nn/transformers
edited: 2025-04-01T17:31
created: 2024-03-19T22:06
---
# Definition:
Definition

---
# Notes:
LLMs like Llama point out data mixtures are important.
- Data blending and ordering matter!

Formalize "two phase pretraining", finds this is better than traditional "continuous" training.
1. Broad diverse dataset for language understanding
2. High quality domain-specific data
3. Note that careful selection matters since we don't want to overfit.

Results:
1. Two phase after 700B tokens provides better performance
2. Result scales with token count and parameter size
3. Phase one vs two duration -- 40% phase 2 is peak before we start overfitting on specialized data.

---
# Examples:
Examples

----
# Source:
Source
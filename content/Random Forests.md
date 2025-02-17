---
aliases: 
tags:
  - ds/ml/trees
edited: 2025-02-16T21:02
created: 2024-03-19T22:06
---
# Definition:
An improvement on [[Bootstrap Aggregating]] for [[Decision Trees]] which attempts to reduce [[Correlation (Pearson)|Correlation]] between each tree.

We limit the possible features used to build each split at the tree to some fraction, e.g., $\approx \sqrt{p}$ of the total features $p$. 

---
# Notes:
#### How it Works
1. Suppose we have a 

---
# Examples:
Examples

----
# Source:
Source
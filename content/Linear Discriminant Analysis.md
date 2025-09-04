---
aliases: 
tags:
  - ds/ml/featureeng
  - ds/dimension_reduction
  - todo
edited: 2025-07-26T12:15
created: 2024-03-19T22:06
---
# Definition:

Similar to [[Principal Component Analysis|PCA]] or [[Independent Components Analysis]], but we find some linear separators based on the class labels.

We find a line and project things onto the line so that they clump together by label value.

---
# Notes:

Assume the [[Probability Density Function|PDF]] of the labels are all [[Normal Distribution]]. 
- We also assume [[Homoskedasticity]], i.e., equal variance across label classes.
- [[Bayesian Learning]] would suggest some threshold $c$ based on a [[Linear Combination]] of features.


This is very similar to 

---
# Examples:
Examples

----
# Source:
Source
---
aliases:
  - Bagging
tags:
  - ds/ml
edited: 2025-02-15T16:31
created: 2024-03-19T22:06
---
# Definition:
A type of [[Ensemble (Machine Learning)]] which combines many of the same weak learner together using [[Bootstrapping]].

1. Create a bunch of subsets of the training data through random sampling with replacement.
2. Train a machine learning model on each training data.
3. Aggregate the model outputs together using the mean ([[Regression]]) or mode ([[Classification]])

---
# Notes:
Typically used with [[Decision Trees]].
Helps reduce [[Variance]] and [[Overfitting]]. 
- Each model can overfit on a subset of the data.
- Aggregating them together helps to smooth this out.

Typically, bag size should be $\sim60\%$ of the overall data size.

---
# Examples:
Examples

----
# Source:
Source
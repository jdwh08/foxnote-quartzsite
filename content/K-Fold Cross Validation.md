---
aliases:
  - Roll Forward Cross Validation
tags:
  - ds
edited: 2025-02-15T16:27
created: 2024-03-19T22:06
---
# Definition:
A generalized form of [[Train Test Split]], particularly useful for small datasets.

Create $K$ datasets of equal size randomly from the overall data. Then for $n$ trials, we randomly assign some of the datasets to be training, and the remaining to be testing.

This allows us to get reasonable estimates for the model in out-of-sample (i.e., test for [[Overfitting]]), while using the entire dataset.

---
# Notes:

For [[Time Series]], we want to ensure that no future data leaks into the training. Thus, we use a variant called Roll Forward Cross Validation, where we require all test sets to be after the training sets.
- E.g., Train0 Test1; then Train1 Test2; then Train2 Test3, ... etc.

---
# Examples:
Examples

----
# Source:
Source
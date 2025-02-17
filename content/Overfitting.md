---
aliases:
  - Overfit
tags:
  - ds
  - ds/ml
edited: 2025-02-17T10:16
created: 2024-03-19T22:06
---
# Definition:
When a [[Machine Learning]] model performs very well in the training set at the expense of performing on the generalized problem.

Occurs under the following conditions:
1. Model is "very expressive", i.e., can easily represent complicated patterns in the features.
2. Model is overtrained on the training dataset
3. Training dataset inevitably has noise from [[Statistical Learning|Irreducible Error]], which is not helpful for solving the overall problem.
4. Model thus learns the irreducible error noise too well, resulting in worse performance in more generalized, out of sample error.

To combat this, we need to get out of sample performance, e.g., via [[Train Test Split]] or [[K-Fold Cross Validation]].

---
# Notes:
![[Overfitting.excalidraw.svg]]

---
# Examples:
Examples

----
# Source:
Source
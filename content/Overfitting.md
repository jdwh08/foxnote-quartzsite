---
aliases:
  - Overfit
tags:
  - ds
  - ds/ml
edited: 2025-02-22T14:30
created: 2024-03-19T22:06
---
# Definition:
When a [[Machine Learning]] model performs very well in the training set at the expense of performing on the generalized problem.

Occurs under the following conditions:
1. Model is "very expressive", i.e., can easily represent complicated patterns in the features.
2. Model is overtrained on the training dataset
3. Training dataset inevitably has noise from [[Statistical Learning|Irreducible Error]], which is not helpful for solving the overall problem.
4. Model thus learns the irreducible error noise too well, resulting in worse performance in more generalized, out of sample error.

To combat this, we can do a couple things:
1. Measure and evaluate using out of sample performance, e.g., via [[Train Test Split]] or [[K-Fold Cross Validation]].
2. Add [[Regularization]] to the data to penalize large parameter sizes.
3. Add more data so it becomes harder to overfit!
	1. In #stats, a rule of thumb is that our dataset size should be 5-10x the number of learnable parameters.
	2. In [[Deep Learning]], we can actually do better though. 

---
# Notes:
![[Overfitting.excalidraw.png.svg]]

---
# Examples:
- For linear polynomial models, [[Runge Spikes]]

----
# Source:
Source
---
aliases:
  - Bagging
tags:
  - ds/ml
  - ds/ml/trees
edited: 2025-02-17T09:57
created: 2024-03-19T22:06
---
# Definition:
A type of [[Ensemble (Machine Learning)]] which combines many of the same weak learner together using [[Bootstrapping]] to reduce model variance.

1. Create a bunch of subsets of the training data through random sampling with replacement.
2. Train a machine learning model on each training data.
3. Aggregate the model outputs together using the mean ([[Regression]]) or mode ([[Classification]])

or more formally,


..\hat{f}_\text{bag}(x)=1/B\sum_{b=1}^B \hat{f}^{*\text{bootstrap}}(x)$



---
# Notes:
Typically used with [[Decision Trees]].
Helps reduce [[Variance (estimator)]] and [[Overfitting]]. 
- Each model can overfit on a subset of the data.
- Aggregating them together helps to smooth this out.
- We can estimate the variance with [[Out of Bag Cross Validation]].

Typically, bag size should be $\sim60\%$ of the overall data size.

**Variable Importance**
Bagging makes interpretation difficult.
To determine which feature are useful, we can use the gain for [[Residual Sum of Squares]] or [[Gini Index]] from the splits built on that feature.

---
# Examples:
Examples

----
# Source:
Source
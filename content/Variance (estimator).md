---
aliases: 
tags:
  - stats
edited: 2025-02-16T16:28
created: 2024-03-19T22:06
---
# Definition:
The [[Variance]] applied to estimators: 
How much would our estimator $\hat{\theta}$ change if we trained it on a different dataset? 

$$Var(\hat{\theta})=E[(\hat{\theta}-E[\hat{\theta}])^2]$$

---
# Notes:
A component of the [[Bias-Variance Trade Off]], along with [[Bias (estimator)]].

Variance generally happens when our model is overly expressive, so small changes in the underlying data can propagate into large changes in the model.

---
# Examples:
Examples

----
# Source:
Source
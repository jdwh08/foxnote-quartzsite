---
aliases: 
tags:
  - stats
  - ds/ml/linreg
  - math/linear_algebra
edited: 2025-09-24T17:05
created: 2024-03-19T22:06
---
# Definition:
When a feature in a [[Linear Regression]] is essentially a [[Linear Combination]] of other features.

Creates issues because we cannot identify if the change is due to $x$ or the combination of other features.
- Resulting estimators have high [[Variance (estimator)]] / [[Standard Error]]

---
# Notes:

Mitigation Methods:
1. [[Ridge Regularization]]: Pull feature weights down so they are closer to zero by adding the [[L2 Norm]]. AKA makes the design matrix [[Positive Semidefinite Matrix]].
2. Drop the dang features, e.g., [[Feature Selection]].

---
# Examples:
Examples

----
# Source:
Source
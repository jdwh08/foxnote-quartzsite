---
aliases: []
tags:
  - ds/ml
edited: 2025-02-16T16:06
created: 2024-03-19T22:06
---
# Definition:
A learner which is a collection of multiple (weak), [[Machine Learning]] models.

---
# Notes:
Ensembles provide multiple benefits:
1. Typically lower [[Loss function|Loss]] than a single learner
2. Less [[Overfitting]]
	1. Each kind of learner has its own [[Bias (estimator)]], which are diluted when combined together.

---
# Examples:
E.g., we have a [[K-Nearest Neighbours|KNN]], [[Linear Regression]], and [[Decision Trees]] combined together all to predict a value for [[Regression]].

We use [[Bootstrap Aggregating]] or [[Boosting]]

----
# Source:
Source
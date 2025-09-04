---
aliases:
tags:
  - ds/ml
edited: 2025-08-30T16:55
created: 2024-04-04T22:31
---
### Definition:
A [[Supervised Machine Learning]] algorithm. Uses [[Sigmoid Function]] as the "squash function" for a [[Linear Regression]], so that the output is guaranteed to be from $[0,1]$.

---
### Notes:
#todo: derivation and math

---
### Examples:
We could use a cost function and [[Gradient Descent]] if we really wanted to #ds/ml this using [[Cross Entropy]]:
$$J(\theta) = -\frac{1}{m} \sum\limits_{i=1}^m (y \log p(y)) + ((1-y)\log(1-p(y)))$$
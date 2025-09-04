---
aliases: 
tags:
  - ds/ml
edited: 2025-07-26T14:27
created: 2024-03-19T22:06
---
# Definition:

For [[Classification]], the Margin is how far apart the class labels are. 
- E.g., in binary classification, we would want our + class to be as distinctly separated as possible from our - class.

---
# Notes:

- This is the explicit goal of [[Support Vector Machines]].
- This is also applicable for things like [[AdaBoost]].

- We can implicitly get to larger margins (i.e., less overfitting), by attempting to add [[Regularization]], e.g., shrinking weights, which creates a larger distance between classes, i.e., margin.

---
# Examples:
Examples

----
# Source:
Source
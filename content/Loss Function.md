---
aliases:
tags:
  - ds/ml/loss_function
edited: 2025-09-04T22:38
created: 2024-03-19T22:06
---
# Definition:
For [[Machine Learning]], a function which represents how "bad" our output is for the given problem. $\mathcal{L}$.

---
# Notes:

### [[Supervised Machine Learning]]
- Determine the [[Error Function]] (e.g. difference between $y$ and $\hat{y}$)
- Use this to build up some measure of Loss $\mathcal{L}$
- Take the [[Expected Value]] of the loss function to get the [[Risk Function]].

---
# Examples:
- [[Mean Squared Error]]
	- [[Quadratic Loss]]
	- [[Root Mean Squared Error]]
- [[Mean Absolute Error]]

- [[Cross Entropy]]
- [[Classification Error Rate]]
- [[Gini Index]]

- [[Triplet Loss Function]]

----
# Source:
Source
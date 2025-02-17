---
aliases: 
tags:
  - ds/ml
  - stats
edited: 2025-02-16T16:25
created: 2024-03-19T22:06
---
# Definition:

[[Mean Squared Error]] can be decomposed into two components: the [[Variance (estimator)]] and the [[Bias (estimator)]] squared.
$$E[y-\hat{f}(x)] = Var(\hat{f}(x))+[Bias(\hat{f}(x))]^2 + Var(\epsilon)$$

To get a good MSE, we need both low (squared) bias and low variance.
- To get a good estimate of a complex [[Data Generating Process]], we want low bias and thus an expressive model that can fit the data.
- However, expressive models also tend to have high estimator variance as they curve around datasets!
- Thus, there is often a tradeoff that occurs between bias and variance. This drives [[Overfitting]].
- The best theoretically would be the variance of the [[Statistical Learning|Irreducible Error]].

![[Bias-Variance.excalidraw.svg]]

---
# Notes:
Decomposition math: #todo

---
# Examples:
Examples

----
# Source:
ISL Python
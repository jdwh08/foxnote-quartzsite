---
aliases:
  - Unbiased (estimator)
tags:
  - ds/ml
  - stats
edited: 2025-02-16T16:40
created: 2024-03-19T22:06
---
# Definition:
A measure of how different an estimator's [[Expected Value]] is compared to the true value of the parameter.

$$Bias_{\theta}[\hat{\theta}]=E_{x|\theta}[\hat{\theta}] - \theta= E_{x|\theta}[\hat{\theta} - \theta] $$

An **unbiased estimator** has a bias of zero.

ISL: In repeated estimates of some parameter, how much does our estimator systematically over/under- estimate the true population parameter?

---
# Notes:
A component of the [[Bias-Variance Trade Off]], along with [[Variance (estimator)]].

Bias generally happens when our approximation makes strong simplifying assumptions (e.g., [[Linear Regression]] for a non-linear problem).

---
# Examples:
The sample [[Variance]] without Bessel's $n-1$ correction:
#todo

----
# Source:
Source
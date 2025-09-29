---
aliases:
  - Reducible Error
  - Irreducible Error
tags:
  - stats
  - ds/ml/theory
edited: 2025-09-28T22:48
created: 2024-03-19T22:06
---
# Definition:
A framework for thinking about [[Machine Learning]] from a [[Statistics]] perspective.

---
# Notes:

### Formal Definition
Given some training data $(x_1, y_1), ...$, learn something about $f$. 

We have some features as input variables ($X...X$) and a response variable $y$.
- Generated via some shared [[Data Generating Process]] for both train and test.

This can be modelled as $Y=f(X)+\epsilon$.
- $f(X)$ is our function, the **systematic information** that X provides.
- $\epsilon$ is our **random error**, which is [[Independent|Independent]] and we also assume [[Expected Value]] of zero.
	- Note that this is a similar assumption as in [[Linear Regression]]. 

There are two common situations for how we use $f$:
- [[Prediction (stats)]]: Just care about getting good $\hat{y}$
	- Train performance, test set performance, [[Overfitting]] and Underfitting
- [[Causal Inference]]: Care about effects, effect size, and functional form

---
# Examples:
Examples

----
# Source:
ISLv2
Deep Learning Goodfellow
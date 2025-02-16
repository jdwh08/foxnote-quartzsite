---
aliases:
  - Reducible Error
  - Irreducible Error
tags:
  - stats
edited: 2025-02-15T15:45
created: 2024-03-19T22:06
---
# Definition:
A set of tools for understanding data by estimating the function that goes from inputs $X$ to outputs $y$ 

Given some training data $(x_1, y_1), ...$, learn something about $f$. 

We have some features as input variables ($X...X$) and a response variable $y$.
This can be modeled as $Y=f(X)+\epsilon$.
- $f(X)$ is our function, the **systematic information** that X provides.
- $\epsilon$ is our **random error**, which is [[Independent Events|Independent]] and we also assume [[Expected Value]] of zero.
	- Note that this is a similar assumption as in [[Linear Regression]]. 

---
# Notes:
 Roughly analogous to [[Machine Learning]], but ISL's authors come from stats.

There are two common situations for how we use $f$:
- [[Prediction (stats)]]: Just care about $\hat{y}$
- [[Inference (stats)]]: Care about $x$ effects and $f$ functional form.

---
# Examples:
Examples

----
# Source:
ISLv2
---
aliases: 
tags:
  - stats/probability
edited: 2025-02-15T16:13
created: 2024-03-03T11:27
---
### Definition:
The average value you expect to get for a [[Random Variable]].

**Discrete Case**
$E[X] = \sum_{x \in \mathcal{X}} xP(X=x) = \sum_{x \in \mathcal{X}} xp(x)$ with $p(x)$ as the [[Probability Mass Function]].

**Continuous Case**
$E[X] = \int_{-\infty}^{\infty} x f(x) dx$ with $f(x)$ as the [[Probability Density Function]].

---
### Notes:
You can also apply this to functions too! E.g., to calculate the expected value of $E[g(x)]=\sum_{x\in \mathcal{X}} g(x)P(X=x)=\sum_{x\in \mathcal{X}} g(x)p(x)$
or
$E[g(x)] = \int_{-\infty}^{\infty} g(x) f(x)dx$
- Special case where $g(x)=x^k$. $E[X^k]$ is the kth [[Moments of Random Variable|moment]] of x.

**Properties of Expected Value:** Linear transformations.
Given a random variable $X$, and some [[Linear Transformation]] function $g(x) = aX + b$, 
$E(aX+b)=aE(x)+b$

---
### Examples:
 Suppose $Y=(X-1)^2$, with the following table for X, where X is the number of heads obtained in 4 tosses of a fair coin:

| $\mathcal{X}$ | pmf $p_x(x)$ | $\mathcal{Y}$ |
| ------------- | ------------ | ------------- |
| 0             | 1/16         | 1             |
| 1             | 4/16         | 0             |
| 2             | 6/16         | 1             |
| 3             | 4/16         | 4             |
| 4             | 1/16         | 9             |
You can still calculate the pmf the same way, combining the two cases for when $Y=1$. Thus, $E(Y) = 0*4/16+1*7/16+4*4/16+9*1/16 = 2$

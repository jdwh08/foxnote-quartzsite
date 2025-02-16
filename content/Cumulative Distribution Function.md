---
aliases:
  - cdf
tags:
  - stats/distributions
edited: 2025-02-15T16:13
created: 2024-03-03T18:06
---
### Definition:
A function which gets the probability that a random variable $x$ is between $(-\infty, z).$

Formally,
Given some [[Random Variable]] X, the CDF is a function F where
- $F(x) = P(X\leq x) = P(X \in (-\infty, x])$

We can sum over the [[Probability Mass Function]] if X is discrete, or integrate over the [[Probability Density Function]] if X is continuous.

---
### Notes:

**Properties of the CDF**
1. Since CDF is the same as $P(X \leq x)$, it must be between 0 and 1 because of the rules of [[Probability]].
2. CDFs never decrease.
3. The CDF of a continuous RV must be [[Continuous Function|continuous]]. As $\delta \rightarrow 0,\  F(x+\delta) - F(x) = \int_{x}^{x+\delta} f(u)du \rightarrow 0$ (i.e., the difference between two points next to each other on the CDF approaches 0 as the delta approaches 0).

When the CDF is differentiable, the PDF can be obtained from the CDF by taking the derivative
- $f(x) = \frac{\partial}{\partial x}F(x)$
from the [[Fundamental Theorem of Calculus]].

**Moments of the CDF**
[[Expected Value]]: $E[X] = \int_{-\infty}^{\infty} x f(x) dx$
- or substitute some $g(x)$ in place of $x$ to get EV for $g(x)$ function, e.g., [[Moments of Random Variable|kth moment]]: $E[x^k]= \int_{-\infty}^{\infty} x^k f(x) dx$
[[Variance]]: $E[(X-\mu)^2]=\int_{-\infty}^{\infty} (x-\mu)^2 f(x) dx$

The same properties from the discrete case hold here, e.g, $Var(x) = E[X^2] - \mu^2$, $E(aX+b)=aE[x]+b$, $Var(aX+b)=a^2Var(x)$

[[Moment Generating Functions]]: $M_x(t)=E[e^{tX}]=\int_{-\infty}^{\infty} e^{tx} f(x) dx$

---
### Examples:
Suppose the PDF is $2e^{-2x}$ for $x>0$, and 0 everywhere else. The CDF is...
- 0 if $x<0$
- $\int_{-\infty}^x f(u)du = \int_0^x 2e^{-2u}du = -e^{-2u}|_0^x = 1-e^{-2x}$

We can also use the CDF to calculate probabilities, e.g., $P(0.5 < X < 1)$ for the above is $F(1) - F(0.5)  = (1-e^{-2}) - (1-e^{-1}) = e^{-1} - e^{-2}$.
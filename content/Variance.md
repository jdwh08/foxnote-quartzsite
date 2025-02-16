---
aliases: 
tags:
  - stats
edited: 2025-02-15T15:45
created: 2024-03-03T11:38
---
### Definition:
One way to measure the "spread" of a [[Random Variable]]. The average squared distance from the mean.

If the RV has probability function $p(x)$ and expected value $E(X)=\mu$, then the **variance** can be computed as
$Var(X) = E((X-\mu)^2) = \sum_{x \in \mathcal{X}} (x-\mu)^2 * P(X=x)$ for the discrete case with [[Probability Mass Function]].
or $=\int_{-\infty}^{\infty} (x-\mu)^2f(x)dx$ where $\mu=E[X]$

Also written as $\sigma^2_x$.

---
### Notes:
Rearranging the formula above, the variance can also be calculated using $Var(X) = E(X^2) - \mu^2$

**Properties of Variance:** Linear transformations.
Given a random variable $X$, and some [[Linear Transformation]] function $g(x) = aX + b$, 
$Var(aX+b)=a^2Var(x)$

---
### Examples:
Examples
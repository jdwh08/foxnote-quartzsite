---
aliases:
  - Central Limit Theorem
  - CLT
tags:
  - stats
edited: 2025-02-15T16:16
created: 2024-03-23T13:03
---
### Definition:
Suppose we have a sequence of [[Independent and Identically Distributed]] [[Random Variable]] with [[Expected Value]] $\mu$ and [[Variance]] $\sigma^2 < \infty$. Then, as the $n \rightarrow \infty$, the sample mean converges in distribution to a [[Normal Distribution]].


..\sqrt{n} (\bar{X_n} - \mu) \overset{d}{\rightarrow} \mathcal{N}(0,1), \\\
\frac{\bar{X}_n - \mu}{\sigma/\sqrt{n}} \sim N(0,1)$



---
### Notes:
The checks on distribution variance are important!

Useful for [[Hypothesis Test]] and [[Confidence Interval]]. So long as the underlying distribution has a definite EV and finite variance, we can guarantee the sample mean is normally distributed!

---
### Examples:
Examples
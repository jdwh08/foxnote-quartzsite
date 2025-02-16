---
aliases:
  - Gaussian Distribution
tags:
  - stats/distributions
edited: 2025-02-15T20:24
created: 2024-03-04T20:57
---
### Definition:
A typical symmetric, bell-shaped distribution.

A [[Random Variable]] X is normally distributed with [[Expected Value|mean]] $\mu$ and [[Variance|variance]] $\sigma^2$ if it has a [[Probability Density Function|PDF]] of
$$f(x; \mu, \sigma) = \frac{1}{\sqrt{2\pi\sigma^2}}e^{-\frac{1}{2}(\frac{x-\mu}{\sigma})^2}$$

which gives it a [[Cumulative Distribution Function|CDF]] of
$$\Phi(z) = \int_{-\infty}^{z} e^{\frac{-u^2}{2}}du$$

What are these values?
- $\mu$ is the population mean
- $\sigma^2$ is the variance
- $\sqrt{2\pi\sigma^2}$ is a normalization constant to ensure the density integrates to one (valid probability)

---
### Notes:
You can look up the probability tables for the normal distribution CDF!
For example, consider this one-tailed distribution: $\Phi(z)=P(Z<z)$ 

![[Normal_Distribution_Z.excalidraw.svg]]

| [[Z-Score]] | x.x0   | x.x1   | x.x2   | x.x3   | x.x4   | x.x5   | x.x6   | x.x7   | x.x8   | x.x9   |
| ----------- | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| -3.4        | 0.0003 | 0.0003 | 0.0003 | 0.0003 | 0.0003 | 0.0003 | 0.0003 | 0.0003 | 0.0003 | 0.0002 |
| -1.0        | .1587  | .1562  | .1539  | .1515  | .1492  | .1469  | .1446  | .1423  | .1401  | .1379  |
| −0.9        | .1841  | .1814  | .1788  | .1762  | .1736  | .1711  | .1685  | .1660  | .1635  | .1611  |
| −0.8        | .2119  | .2090  | .2061  | .2033  | .2005  | .1977  | .1949  | .1922  | .1894  | .1867  |
| −0.7        | .2420  | .2389  | .2358  | .2327  | .2296  | .2266  | .2236  | .2206  | .2177  | .2148  |
| −0.0        | .5000  | .4960  | .4920  | .4880  | .4840  | .4801  | .4761  | .4721  | .4681  | .4641  |

**Scaling Property**
If $Z \sim N(0,1)$ and $X = \mu + \sigma Z$ then $X \sim N(\mu, \sigma^2)$
If $X \sim N(\mu, \sigma^2)$ and $Z=\frac{X-\mu}{\sigma}$, then $Z \sim N(0, 1)$. This is a [[Z-Score]].

This also means that $X \sim N(\mu, \sigma^2)$ gives CDF of $P(X \leq x)=P(\frac{X-\mu}{\sigma} \leq \frac{x - \mu}{\sigma}) = P(Z\sim N(0,1) \leq \frac{x - \mu}{\sigma})$

**Standard Deviations**
- 68-95-99.7% Rule: 68% of the data are within 1 standard deviation of the mean, 95% are within 2 standard deviations, and 99.7% are within 3 standard deviations.

---
### Examples:
Examples
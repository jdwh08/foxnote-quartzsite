---
aliases:
  - Unbiased (estimator)
tags:
  - ds/ml
  - stats
edited: 2025-09-22T18:43
created: 2024-03-19T22:06
---
# Definition:
A measure of how different a [[Point Estimator]]'s [[Expected Value]] is compared to the true value of the parameter.



Bias_{\theta}[\hat{\theta}]=E_{x|\theta}[\hat{\theta}] - \theta= E_{x|\theta}[\hat{\theta} - \theta] $



An **unbiased estimator** has a bias of zero.

ISL: In repeated estimates of some parameter, how much does our estimator systematically over/under- estimate the true population parameter?

---
# Notes:
A component of the [[Bias-Variance Trade Off]], along with [[Variance (estimator)]].

Bias generally happens when our approximation makes strong simplifying assumptions (e.g., [[Linear Regression]] for a non-linear problem).

Compare this to [[Consistency (estimator)]] which is for asymptotic behaviour.

---
# Examples:

[[Bernoulli Trial|Bernoulli Distribution]] with the [[Sample Mean]]:
- $p(x,p)=p^x (1-p)^{1-x}$
- We substitute the sample mean:
	- $bias = E[1/n \sum x] - p$
	- $1/n \sum E[x] - p$
	- But we know that the expected value is $p$ by definition of the distribution, thus $p-p=0$ i.e., unbiased.

The sample [[Variance]] without Bessel's $n-1$ correction:
- Suppose we have a [[Normal Distribution]] and we use the [[Sample Variance]]: $1/n \sum (x - \bar{x})^2$
- $E[1/n \sum (x - \bar{x})^2] - \sigma^2 = E[1/n \sum ((x - \mu - (\bar{x} - \mu))^2] - \sigma^2$
- $E[1/n \sum ]$
- $=\sigma^2 - 1/m \sigma^2 - \sigma^2 = -1/m \sigma^2$
Thus this is BIASED! (our sample variance underestimates due to us also using the sample mean).

----
# Source:
Source
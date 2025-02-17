---
aliases: 
tags:
  - stats
edited: 2025-02-16T16:59
created: 2024-03-19T22:06
---
# Definition:
If we repeatedly estimate some parameter $\theta$ using a sample of data, how far away will our estimate $\hat{\theta}$ typically be?

When applied to estimators, equivalent to the square root of the [[Variance (estimator)]].

---
# Notes:
Notes

---
# Examples:


**SAMPLE MEAN**
Suppose we have n [[Independent and Identically Distributed|IID]] samples taken from a population with a population [[Standard Deviation]] of $\sigma$. Consider the [[Sample Mean]] $\bar{x}$ as an estimator. Its standard error $\sigma_{\bar{x}}=\frac{\sigma}{\sqrt{n}}$.

Typically, we don't know the true standard deviation $\sigma$, so estimate it with the [[Sample Standard Deviation]] $\hat{\sigma}_x = \sigma_x / \sqrt{n}$. 

##### A quick differential diagnosis: these are different
- Standard Deviation of the population $\sigma$
- Standard Deviation of the sample $\sigma_x$
- Standard Deviation of the sample mean $\sigma_{\bar{x}}$.
- Estimator of the Standard Deviation of the Sample Mean: $\hat{\sigma}_{\bar{x}}=\sigma_x / \sqrt{n}$. YOU ARE HERE!

----
# Source:
Source
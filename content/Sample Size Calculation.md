---
aliases:
tags:
  - stats/hypothesis_tests
edited: 2025-08-26T21:22
created: 2024-04-23T18:34
---
# Definition:
Way to determine optimal sample size for a statistical test.
You have limitations on how much data can be collected.

---
# Notes:

### Sample Size vs Power Tradeoff
- Start with power: probability of rejecting the null hypothesis given the null hypothesis is false. (See [[Hypothesis Test]]).
- More sample size increases power, because it shrinks the [[Variance]] of the sampling distribution.
- We want to pick the sample size such that it gives sufficient power, however there is not a linear relationship between power and sample size.

#### Formulas
- [[Two Sample T-Test]]: 
$$n=(z_{\alpha/2}+z_{\beta})^2 * \frac{\sigma_1^2 + \sigma_2^2}{(\mu_1 - \mu_2)^2}$$

### [[Monte Carlo Simulation]]
Instead of formulas, we can exploit [[Monte Carlo Simulation]] with the definition of power.

1. Generate data. 
	1. For this example with [[Two Sample T-test]], we use two [[Normal Distribution]]. Parameters of normal distributions determine whether null or alternate hypothesis is true. 
	2. Recall that power is probability of reject if reject is true.
2. Apply statistical procedure. 
	1. For us, we calculate the test statistic t, and the sampling distribution, which is a [[t-Distribution]]. (Two sided, 0.05)
3. Keep track of whether the null hypothesis is rejected or not, by testing whether the [[Confidence Interval]] includes the null hypothesis value.
4. For Monte Carlo, we repeat this multiple times and compile the results. Replication should be high (e.g., 10,000) because we're exploiting the [[Law of Large Numbers]]	
	1. As the number of replications becomes large, the sample power (number of times the null hypothesis is rejected given that it is false) approaches the true power.
5. We can rerun this for multiple different sample sizes, until we get one that meets the desired power.

Monte Carlo has the benefit of allowing for a significant degrees of freedom.
- Cauchy Distribution instead of Normal Distribution, or other tests like the Mann-Whitney test as a [[Nonparametric Test]] alternative.

---
### Examples:
Examples
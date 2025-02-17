---
aliases: 
tags:
  - stats
  - stats/hypothesis_tests
edited: 2025-02-16T17:18
created: 2024-04-23T18:34
---
### Definition:
Way to determine optimal sample size for a statistical test.
You have limitations on how much data can be collected.

---
### Notes:
Start with power: probability of rejecting the null hypothesis given the null hypothesis is false. (See [[Hypothesis Test]]).
More sample size increases power, because it shrinks the [[Variance]] of the sampling distribution.

We want to pick the sample size such that it gives sufficient power, however there is not a linear relationship between power and sample size.
[[Two Sample T-Test]]: $n=(z_{\alpha/2}+z_{\beta})^2 * \frac{\sigma_1^2 + \sigma_2^2}{(\mu_1 - \mu_2)^2}$

Instead of using the formula, we can exploit [[Monte Carlo Simulation]] simulations.
1. Generate data. For this example with two sample detest, we use two [[Normal Distribution]]. Parameters of normal distributions determine whether null or alternate hypothesis is true. (For power, we use alt.)
2. Apply statistical procedure. For us, we calculate the test statistic t, and the sampling distribution, which is a [[t-Distribution]]. (Two sided, 0.05)
3. Keep track of whether the null hypothesis is rejected or not, by testing whether the [[Confidence Interval]] includes the null hypothesis value.
4. For Monte Carlo, we repeat this multiple times and compile the results. Replication should be high (e.g., 10,000) because we're exploiting the [[Law of Large Numbers]]	
		- As the number of replications becomes large, the sample power (number of times the null hypothesis is rejected given that it is false) approaches the true power.
5. We can rerun this for multiple different sample sizes, until we get one that meets the desired power.

Monte Carlo has the benefit of allowing for a significant tomato freedom, EG, using a Kashi distribution instead of normal distribution, or other tests like the Mann-Whitney test as a [[Nonparametric Test]] alternative.

---
### Examples:
Examples
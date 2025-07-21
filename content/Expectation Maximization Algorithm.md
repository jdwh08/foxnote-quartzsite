---
aliases:
  - EM Algorithm
tags:
  - stats
  - ds/ml
edited: 2025-06-14T11:11
created: 2024-03-19T22:06
---
# Definition:
A process for jointly estimating some data AND hidden distribution parameters by maximizing expectation.

Intuition Process:
1. Make initial parameter estimates
2. Get most probable values for missing data from parameters.
3. Get most likely values for missing parameters from data.
4. Repeat until convergence.

---
# Notes:

### Algorithm
- Suppose we have some probability of missing value $p(x|\mu) \sim N(\mu, 1)$.
- We get the [[Likelihood]] $\mathcal{L}([x, 1, 2] | \mu)$
	- Then use the [[Log Likelihood]] approach by taking the log to make it easier (sums).
	- $\mathcal{L}(x|\mu) + \mathcal{L}(1|\mu) + \mathcal{L}(2|\mu)$
- Get initial guesses $\mu_0, x_0$.
- Apply $E$ expectation step.
	- "What's the best updated value for the $\mu$ given our new data?"
	- $E[\mathcal{L} | \mu] = \int_{x} p(x|\mu_0) * \mathcal{L}([x,1,2]|\mu) dx$
	- This is ONLY A FUNCTION OF $\mu$. $x$ is frozen here.
	- Integrate across all the possible values of $x$.
	- Calculate the probability that we get $x$ given the current $\mu_0$. For very unlikely values, this gets close to zero. Thus, the probability acts like a weight for values we think are most probable.
	- Get the likelihoods of the data with the new proposed $\mu$. 
- Apply $M$ maximization step
	- $\mu_1 = \underset{\mu}{\arg\max} E[\mathcal{L} | \mu]$
	- I.e., our new estimate for $\mu$ is the value that maximizes that weighted likelihood.

### Convergence
Why is this **guaranteed to essentially converge?**
- Our likelihood is strictly better after each expectation step and maximization step
- The likelihood has some defined maximum.

#### Pros and Cons:
- Unlike [[Gradient Descent]], which can also be used to solve similar problems, EM doesn't require us to calculate derivatives (which might be hard).
	- Can work with any distribution so long as we can do it!
	- Expectation is usually probabilistic stuff and computationally intensive, while Maximization is typically just counting and max.
- EM may converge slower than other approaches.
- EM can get stuck in [[Local Optima]]

### Cases to Use:
- Finding missing data and missing parameters
- [[Soft Clustering|Gaussian Mixture Models]] for [[Clustering]]
	- We have k classes, AND we don't really know the parameters for the distributions that generate the classes, AND we don't know what data goes in each class.

---
# Examples:

**Case 1: Missing Data**
Suppose we have data $[1,2, x]$ $\sim N(1,1)$ [[Normal Distribution]]. What is our best guess for x?
- Based on the Normal distribution, the value with the highest probability is **1**, the distribution's mean.

**Case 2: Missing Parameter**
Suppose we have data $[1,2,0] \sim N(\mu, 1)$. What is our best guess for $\mu$? 
- We can use [[Maximum Likelihood Estimation]]. In this case, we don't really need to; the highest likelihood is the sample mean value, so **1**.

**Case 3: EM is Needed, Simple Test Case**
Suppose we have data $[1,2, x] \sim N(\mu, 1)$. What is our best guess for $x, \mu$.
- We use the EM Algorithm!
1. Make a guess for $\mu$, called $\mu_0$. We choose 0.
2. Using $\mu_0$, make a guess for $x$ called $x_0$ using the logic from Case 1. 
	1. $x_0 = 0$ since it's the mean of the distribution.
3. Using $x_0$, make a guess for $\mu$ called $\mu_1$ using the logic from Case 2.
	1. $\mu_1 = 1$, the sample mean.
4. Using $\mu_1$, make a guess for $x_1$
	1. $x_1=1$
5. ... repeat until convergence. 
6. Eventually, we see that this converges when $\hat{\mu}_{EM} = S_x = \hat{x}$.


----
# Source:
RitivikMath EM Algorithm
---
aliases:
  - Gaussian Mixture Models
tags:
  - ds/ml/cluster
edited: 2025-06-12T19:30
created: 2024-03-19T22:06
---
# Definition:
A type of [[Clustering]] which assumes some [[Data Generating Process]] and assigns points based on their [[Maximum Likelihood Estimation]]

---
# Notes:

### Algorithm
1. Select some [[Data Generating Process]], e.g., K [[Normal Distribution]]s
	1. Sample $x_i$ from the distribution.
	2. Repeat $n$ times.
2. Find some [[Maximum Likelihood Estimation]] 
	1. The [[Maximum Likelihood Estimation|MLE]] of the gaussian's mean $\mu$ is the [[Sample Mean]].
	2. We assume there are some hidden variables which control which cluster the point actually goes to.
	3. We use [[Expectation Maximization Algorithm]]!

Probability for belonging in some cluster $j$:


E[z_{ij}] = \frac{P(x=x_i | \mu=\mu_j)}{\sum_j P}$


Means for the clusters given probability:


\mu_{ij}=\frac{\sum_i E[z_{ij}] * x_i}{\sum_i E[z_{ij}]}$


We get the probabilities, then assign clusters, then get the probabilities, etc. and repeat in the [[Expectation Maximization Algorithm|EM Algorithm]].

##### Comparison to [[K-Means Clustering]]:
- Imagine if our probabilities were forced to be $\{0, 1\}$ which we obtain by maximizing the [[Likelihood]].
- Points are classified using [[Probability]] instead of hard cluster sets.

---
# Examples:
Examples

----
# Source:
GaTech ML
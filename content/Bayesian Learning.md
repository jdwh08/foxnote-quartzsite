---
aliases: 
tags:
  - cs/theory
  - ds/ml/theory
edited: 2025-06-06T04:38
created: 2024-03-19T22:06
---
# Definition:

Try to learn the **best** hypothesis for a [[Machine Learning]] model given the data (+ domain).
- where **best** refers to the *most probable*: $\arg_h \max P(h | data)$

---
# Notes:

[[Bayes' Rule]]: $P(h|d) = P(d|h) * P(h) / P(d)$. 
- $P(d)$ is a prior for the data. 
- $P(h)$ is a prior for the hypothesis. "Domain Knowledge".
- $P(d|h)$ is probability of data given the hypothesis, i.e., [[Likelihood]]
	- Very easy to compute from empirical

If we want to find the model that maximizes $P(h|d)$...
- Drop $P(d)$ since irrelevant to h; this maximizes the a-posterior
	- NOTE: $\arg \max P(d|h) * p(h) = \arg\max (\log P(d|h) + \log P(h))$ 
	- $\arg\min (-\log P(d|h) - \log P(h))$
	- We can use #information_theory  where $-\log P(h)$ is the "length" of the model, i.e., how many bits of information it takes to send, and $-\log P(d|h)$ measures the information needed to go from the model to the actual data, i.e., error.
	- This is the **Minimum Description**; note that this is a tradeoff
- Drop $P(h)$ and assume a [[Uniform Distribution]] for priors
- This is the [[Maximum Likelihood Estimation]] estimator.
	- NOTE: not actually practical in some cases if the number of possible models is large.

If we know that the data is noise free, the true [[Data Generating Process]] is in our dataset, and we have a [[Uniform Distribution]] as prior...
- $P(h)=1/|H|$
- $P(d|h)=\mathbb{1}(d=h(x))$ aka model matches data aka [[Version Space]]
- $P(d)= \sum P(d|h) * p(h) = |VS| / |H|$
- $P(h|d) = 1 / |VS|$ wow yeah

If we know the noise is [[Normal Distribution|normally distributed]], this is the classic MLE estimator resulting in minimizing the [[Mean Squared Error]].
- $d=f(x)+\epsilon$, $\epsilon \sim N(0, \sigma^2)$ and [[Independent and Identically Distributed|IID]]
- Bayesian justification for all the MSE stuff, but doesn't work for other noise


NOTE: Finding the best hypothesis is not the same thing as finding the best label.
- Really speaking, we want to find the **label** not the **model**
- The "Bayes Optimal Classifier" is the one where all hypotheses vote weighted by their probability given the data.

---
# Examples:
Examples

----
# Source:
Source
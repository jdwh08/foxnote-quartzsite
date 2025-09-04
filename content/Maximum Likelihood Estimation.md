---
aliases:
  - MLE
  - M-Estimator
tags:
  - ds/ml
  - stats/mest
edited: 2025-09-04T09:29
created: 2024-03-19T22:06
---
# Definition:
A [[Statistical Learning]] technique where we try to estimate our model's parameters $\theta$ using by maximizing the [[Likelihood]] based on the data.

$$\hat{\theta}_{MLE} = \underset{\theta}{\arg\max} \prod_{i=0}^{n} p(x_i| \theta)$$
Often we actually use the min of the negative [[Log Likelihood]] instead because it's easier:
$$\hat{\theta}_{MLE} = \underset{\theta}{\arg\min} \frac{-1}{N} \sum_{n=1}^N 
\log p(x_i| \theta)$$

---
# Notes:

### Method
We set the negative log probability to be our [[Loss Function]], thus creating [[Log Likelihood]] (the [[Cross Entropy]] idea).
$$l(y, f(x, \theta)) = -log(p(y\ 
|\ f(x, \theta)))$$
We then get the negative log likelihood:
$$NLL(\theta) = \frac{-1}{N} \sum_{n=1}^N log(p(y\ 
|\ f(x, \theta))$$
and thus can find our maximum likelihood estimator:
$$\hat{\theta}_{MLE} = \underset{\theta}{\arg\min} \frac{-1}{N} \sum_{n=1}^N log(p(y\ 
|\ f(x, \theta))$$

### Required Conditions: "Regularity Conditions"
1. Data is [[Independent and Identically Distributed|IID]] on some density.
2. Parameter space is compact.
3. The true parameter can be uniquely identified.
4. The [[Likelihood]] is [[Continuous Function]].
5. The [[Expected Value]] of the [[Log Likelihood]] exists.
6. $1/n * \mathcal{L}$ [[Convergence Almost Surely]] to the expected value of the log likelihood.

##### Additional Requirements for Asymptotic Normal
1. Log likelihood is twice continuously [[Differentiable Function]] around the true $\theta$
2. The [[Fisher Information Matrix]] exists and is not a [[Singular Matrix]].

### Properties
- This is a [[Consistency (estimator)|consistent]] estimator if...
	- Our choice of model family $\hat{f}$ includes the true distribution $p$ at exactly one $\theta$ value.

- [[Cramer Rao Lower Bound]]: No [[Point Estimator]] with [[Consistency (estimator)]] has a lower [[Mean Squared Error]] than the MLE estimator.
	- I.e., [[Variance (estimator)]] is the inverse of the [[Fisher Information Matrix]].
	- "Asymptotically Efficient"

- This has an asymptotic [[Normal Distribution]]: $\hat{\theta}_{MLE} \sim AN(\theta, I(\theta)^{-1})$, where $I$ is the [[Fisher Information Matrix]].
	- Useful for getting [[Standard Error]] for estimators.

### Solving
1. Use [[Calculus]] and derive it analytically using optimization. Difficult when the estimator gets too complex.
2. [[Monte Carlo Simulation]]! We repeatedly generate data and pick out the MLE. 

### Connections
- Equivalent to minimizing the [[Kullback-Leibler Divergence|KL Divergence]] between our data and the model.
	- When we train our model $\hat{p}$, we are basically trying to minimize this divergence.
	- Notice that the $p_{data}$ is fixed by the [[Data Generating Process]], so this just becomes the negative [[Log Likelihood]].

$$D_{KL} (p_{data} || \hat{p}) = \mathbb{E}_{x\sim p_{data}} \left[ \log p_{data}(x) - \log \hat{p}(x) \right]$$

- Provides a justification for many [[Loss Function]]s and other choices in [[Statistical Learning]]
	- E.g., [[Mean Squared Error|MSE]]. See the Statistical Learning page for more.

---
# Examples:

----
# Source:
[Maximum Likelihood Very Normal](https://www.youtube.com/watch?v=YevSE6bRhTo)
Probabilistic Machine Learning Kevin Murphy
[MLE Cornel Econ 620]([reviewm5.dvi](https://courses.cit.cornell.edu/econ620/reviewm5.pdf)) 
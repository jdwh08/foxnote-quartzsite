---
aliases: 
tags:
  - ds/ml/trees
  - stats/probability/bayesian
edited: 2025-07-26T14:15
created: 2025-02-17T08:49
---
# Definition:
Variant of [[Bootstrap Aggregating|Bagging]] and  [[Boosting]] for [[Decision Trees|trees]] where boosting occurs via making small changes to pre-existing trees in order to better fit [[Residuals]].

---
# Notes:

#### Training Algorithm: Regression
Suppose we have $K$ [[Regression]] trees. Our prediction for tree $k$ at iteration $b$ is $\hat{f}_k^b(x)$.
1. All trees start with a [[Sample Mean]]-like root node: $\hat{f}_k^1(x) = 1/nK \times \sum_i^n y_i$
2. We compute $\hat{f}^1(x) = \sum_k^K \hat{f}_k^1(x) = 1/n \sum_i^n y_i$
3. Like [[Gradient Boosting]], we obtain psuedo-[[Residuals]], but they're a bit different
	1. $r_i=y_i-\sum_{k' < k} \hat{f}_{k'}^b(x_i) - \sum_{k' > k} \hat{f}_{k'}^{b-1}(x_i)$
	2. We **do not fit a fresh tree to the residual!**
	3. Instead, our target residual *subtract the predictions for all trees except $k$*
	4. Note that we update these trees one-at-a-time, so trees where $k'>k$ are not updated yet. Hence the $\hat{f}^{b-1}$.
4. We then randomly apply some change to the tree $\hat{f}_{k}^{b-1} \rightarrow \hat{f}_{k}^{b}$, e.g., adding or pruning splits, or changing the predictions of a terminal node.
	1. We favour changes that improve the fit to the partial residuals.
	2. Slight modifications to trees helps prevent [[Overfitting]]. We also restrict tree size to be small.
	3. Allowing these perturbations allow us to search more of the [[Decision Trees]] space, as opposed to greedy algorithms.
5. We update the model for $\hat{f}^b(x) = \sum_k^K \hat{f}_k^b(x)$.
6. Once we build all $B$ trees, for [[Regression]] we predict the mean. We ***throw away*** the first $L$ models ("burn-in") because they suck, e.g., 200.
	1. Our final $\hat{f}(x) = \frac{1}{B-L} \sum_{b=L+1}^B \hat{f}^b(x)$

###### Hyperparameters:
$K=200, B=1000, L=100$ are reasonable choices. Performs well with minimal tuning.

#### [[Bayesian Statistics]] Connection:
- Applying these small changes ("perturbations") is essentially drawing a new tree from a [[Prior and Posterior Probabilities|Posterior]] distribution.
- Our regression algorithm is equivalent to a [[Markov Chain Monte Carlo]] approach for fitting trees.

---
# Examples:
Examples

----
# Source:
ISLp
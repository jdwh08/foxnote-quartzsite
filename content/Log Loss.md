---
aliases:
  - Cross Entropy Loss
tags:
  - ds/ml/loss_function
edited: 2025-09-24T17:05
created: 2024-03-19T22:06
---
# Definition:
A type of [[Loss Function]] mainly for [[Classification]] which is derived from [[Cross Entropy]].
$$\mathcal{L} =-\frac{1}{N}\sum_{c}^{N} y_c \log(\hat{y})$$

---
# Notes:

### Alternatives
For binary classification treating as a [[Bernoulli Trial|Bernoulli]], we get
$$=-(y log(p) + (1-y) log(1-p))$$
We can also vectorize this:
$$-y^T\log(p)-(1-y)^T\log(1-h)$$

### Class Weights
- Imbalanced data may be an issue since the high number of observations of majority class dominate the loss compared to minority classes.
- To fix, we can add class-specific weights $\alpha_c$.
$$\mathcal{L}(y, \hat{y}) = -\frac{1}{N} \sum_c \alpha_c \cdot y_c \log(\hat{y})$$

##### Class Weight Strategies
1. Reciprocal of number of observations in training set.
	1. Idea is that smaller classes will thus get higher weights.
2. [Class-Balanced Loss Based on Effective Number of Samples](https://arxiv.org/abs/1901.05555) (Cui et al 2019) 
	1. Calculates the "effective" count of samples instead as $(1-\beta^n)/(1-\beta)$
	2. We take the reciprocal.

### Properties
1. This is a **[[Strictly Proper Scoring Rule]]**, i.e., given some probability estimate $\hat{p}$ and true probability $p$, we minimize the [[Expected Value]] of this loss when our estimates and true probabilities are exactly the same [[Probability Distribution]].
	1. I.e., if we minimize Log Loss, we also learn reliable probabilities.
2. This is derived from [[Maximum Likelihood Estimation]] using [[Bayesian Learning]].
3. It is the basis for [[Mean Squared Error]] if we assume the data has [[Normal Distribution]].

#### Derivation from [[Bayesian Learning]]:
- Suppose we have some $x$ values which occur with binary $y$ labels ${0,1}$. 
- Our goal would be to [[Maximum A Posteriori Estimation|MAP Estimator]] but we can basically just use [[Maximum Likelihood Estimation|MLE]] instead for uniform prior. 
- Start by using the [[Cross Entropy]]
- Then, our likelihood is something like $\prod\hat{p}(y=\hat{y})^y$
- Notice how this only matters when $\mathbb{1}(y=\hat{y})$, because elsewhere $y=0$.
- We can finally take the [[Log Likelihood]] and flip (minimize loss) to get $-\sum y \log (\hat{p})$

#### Learning with [[Gradient Descent]]
- Generally we have $y$ be the labels. Then, this is simply the derivative with respect to $x$ within the log, so $1/x$.
- When used with the [[Softmax]], we get our [[Gradient]] [[Jacobian]] in terms of [[Softmax]] $s$ as:
$$\frac{\partial L}{\partial a_{output}} = a_{output} - y_{onehot}$$

### Alternatives
- [[Brier Score]]: [[Mean Squared Error|MSE]] on probability residuals instead of log; penalizes high probability stuff less. 
- [[Focal Loss]]: Add a $(1-\hat{y})^{\gamma}$ "focusing" term which gives additional weight for samples which are "difficult" (i.e., low $\hat{y}$ for true $y$).

---
# Examples:
Examples

----
# Source:
Source
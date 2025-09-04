---
created: 2024-03-20T10:03
edited: 2025-08-30T16:59
tags:
  - stats
  - ds/ml/loss_function
  - information_theory
aliases:
  - Log Loss
---
# Definition:
Measures performance of classification models whose output is a [[Probability]]. 
Increases as the predicted probability diverges from the actual label.

For discrete probability distributions $p, q$ which have the same [[Support (math)|Support]] $\mathcal{X}$,
$$\sum_{x\in \mathcal{X}} p(x) * log(q(x))$$
thus for binary classification treating as a [[Bernoulli Trials and Random Variables|Bernoulli]], we get
$$=-(y log(p) + (1-y) log(1-p))$$
and for multinomial classification we get
$$-\frac{1}{N}\sum_{c}^{N} y_c \log(x)$$


We can also vectorize this:
$$-y^T\log(p)-(1-y)^T\log(1-h)$$

And for continuous distributions, we can have
$$\int_{\mathcal{X}} P(x) log(Q(x)) dx = E_p[-log(Q)]$$

---
# Notes:

### Properties
- Builds from [[Entropy (information theory)]] by doing this across two distributions.
- Minimizing binary cross entropy is equivalent to maximizing the [[Log Likelihood]] (aka Log Loss).
- This is similar but different from [[Kullback-Leibler Divergence]]! 
	- Cross Entropy is the *average* number of bits to represent event Q instead of event P. This is **absolute & average** entropy.
	- KL is the "number of extra bits needed to encode the data because it comes from distribution Q *instead of distribution P*". In other words, KL is **relative** entropy. 
	- Cross Entropy = Entropy from distribution P + KL Divergence between P||Q
- Not symmetrical! 

#### Derivation from [[Bayesian Learning]]:
Suppose we have some datapoints $x$ which occur in the data multiple times, with binary $y$ labels in ${0,1}$. Our goal would be to [[Maximum A Posteriori Estimation|MAP Estimator]] but we can basically just use [[Maximum Likelihood Estimation|MLE]] instead for uniform prior. Then, our likelihood is something like $\prod \mathbb{1}$

### Estimation
We can estimate this empirically with [[Monte Carlo Simulation]]:
$H(T, q) = \sum_{i=1}^{N} \frac{1}{N} log_2(q(x_i))$ where $q(x)$ is the empirical probability of event $x$. 

#### [[Gradient Descent]]
- Generally we have $y$ be the labels. Then, this is simply the derivative with respect to $x$ within the log, so $1/x$.
- When used with the [[Softmax]], we get our [[Gradient]] [[Jacobian]] in terms of [[Softmax]] $s$ as:
$$\frac{\partial L}{\partial a_{output}} = a_{output} - y_{onehot}$$


---
# Example:



---
# Sources:

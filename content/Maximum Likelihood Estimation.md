---
aliases:
  - MLE
tags:
  - ds/ml
  - stats
edited: 2025-02-17T10:20
created: 2024-03-19T22:06
---
# Definition:
A [[Supervised Machine Learning]] technique where we try to estimate our model's parameters $\theta$ using by maximizing the [[Likelihood]] based on the data.

---
# Notes:
Notes

---
# Examples:

We set the negative log probability to be our [[Loss Function]], thus creating [[Log Likelihood]].
$$l(y, f(x, \theta)) = -log(p(y\ 
|\ f(x, \theta)))$$
We then get the negative log likelihood:
$$NLL(\theta) = -\frac{1}{N} \sum_{n=1}^N log(p(y\ 
|\ f(x, \theta))$$
and thus can find our maximum likelihood estimator:
$$\hat{\theta}_{MLE} = \underset{\theta}{\arg\min} -\frac{1}{N} \sum_{n=1}^N log(p(y\ 
|\ f(x, \theta))$$

----
# Source:
Probabilistic Machine Learning Kevin Murphy
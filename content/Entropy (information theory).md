---
aliases: 
tags:
  - information_theory
  - stats
  - ds/ml/loss_function
edited: 2025-02-16T20:12
created: 2024-03-20T15:20
---
### Definition:
The average level of "information" / "surprise" / "uncertainty" for a [[Random Variable]]. As entropy goes down, we have more knowledge about the likely outcomes of that variable. 

Suppose we have a [[Random Variable]] X which takes values in $\mathcal{X}$, with some [[Probability Density Function|Probability Distribution]]. Then, entropy is the sum of $p*logp$ over all values of $\mathcal{X}$:

$$H(X) := -\sum_{x}^{\mathcal{X}} p(x) * \log p(x)$$

---
### Notes:
The log can be base 2, e, or 10.

This is applied to two different distributions using [[Cross Entropy]].

---
### Examples:
Flip a fair coin. Our [[Probability]] of heads is 1/2. We have no information to really know the outcome. This has "1 bit of entropy".
Flip a trick coin with heads on both sides. Our probability of heads is 1. This has no randomness or information, so it has "0 bits of entropy".

A heavily [[Skew|skewed]] probability distribution has the most likely events dominate the results, so is less "surprising". This means it has low entropy compared to a non-skewed distribution.
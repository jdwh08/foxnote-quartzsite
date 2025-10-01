---
created: 2024-03-20T10:03
edited: 2025-09-20T13:06
tags:
  - stats
  - information_theory/entropy
aliases: 
---
# Definition:
Measures performance of classification models whose output is a [[Probability]]. 
Increases as the predicted probability diverges from the actual label.

For discrete probability distributions $p, q$ which have the same [[Support (math)|Support]] $\mathcal{X}$,


..\sum_{x\in \mathcal{X}} p(x) * log(q(x))$



And for continuous distributions, we can have


..\int_{\mathcal{X}} P(x) log(Q(x)) dx = E_p[-log(Q)]$



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

### Estimation
We can estimate this empirically with [[Monte Carlo Simulation]]:
$H(T, q) = \sum_{i=1}^{N} \frac{1}{N} log_2(q(x_i))$ where $q(x)$ is the empirical probability of event $x$. 

---
# Example:



---
# Sources:

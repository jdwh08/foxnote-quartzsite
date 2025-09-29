---
aliases:
  - KL Divergence
  - Relative Entropy
tags:
  - stats/probability
  - information_theory
  - ds/ml/loss_function
edited: 2025-09-22T18:33
created: 2024-03-20T15:40
---
# Definition:
Measures the difference between two probability distributions over the same variable.

$$D_{KL}(p(x)||q(x)) = \sum\limits_{x \in X} p(x) \log \left(\frac{p(x)}{q(x)} \right)$$

When probability in $p$ is big but $q$ is small, then there is a large divergence. When probability in $p$ is small but $q$ is big, there is a smaller divergence.

Can be thought of as the "relative [[Entropy (information theory)]]", as opposed to the [[Cross Entropy]].

Can be used as an evaluation metric between some other distribution and our empirical data distribution we sampled.

---
# Notes:
### [[Information Theory]]:
- "Extra information bits required to encode $p(x)$ when starting from $q(x)$". "Information lost when using $q(x)$ to approximate $p(x)$".
- Note that [[Mutual Information]] is a special case where we are measuring the difference in information between the [[Joint Probability]] and the two individual probabilities multiplied together.

### Properties
- Not a [[Distance Measure]] because it is... 
	- Not symmetric!
	- Does not meat the triangle inequality!

---
# Examples:
Can be used to calculate how much the current distribution diverges from the baseline distribution (e.g., for monitoring).

---
# Source:

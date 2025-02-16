---
aliases:
  - KL Divergence
  - Relative Entropy
tags:
  - stats/probability
  - information_theory
edited: 2025-02-15T16:31
created: 2024-03-20T15:40
---
### Definition:
Measures the difference between two probability distributions over the same variable.

$D_{KL}(p(x)||q(x)) = \sum\limits_{x \in X} p(x) ln(\frac{p(x)}{q(x)})$.

When probability in $p$ is big but $q$ is small, then there is a large divergence. When probability in $p$ is small but $q$ is big, there is a smaller divergence.

Can be thought of as the "relative entropy", as opposed to the [[Cross Entropy]].

---
### Notes:
Information Theory Interpretations:
- "Extra information bits required to encode $p(x)$ when starting from $q(x)$". "Information lost when using $q(x)$ to approximate $p(x)$".

- Not a true measure of distance because it is... 
	- Not symmetric!
	- Does not meat the triangle inequality!

---
### Examples:
Can be used to calculate how much the current distribution diverges from the baseline distribution (e.g., for monitoring).

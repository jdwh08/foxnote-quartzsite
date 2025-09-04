---
aliases:
tags:
  - math/linear_algebra
edited: 2025-08-21T19:14
created: 2024-03-19T22:06
---
# Definition:
Obtains the "size" of a [[Vector]].

---
# Notes:

Geometrically: We can think of the vector as something going out from the origin in [[Vector Space]]. The norm acts like a measure of "distance" from the origin.

### Formal Definition:
A real-valued function from [[Vector Space]] to the reals $p: \mathbf{X} \rightarrow \mathbb{R}$ which has the following properties:
1. Obeys the [[Triangle Inequality]]
2. Has [[Absolute Homogeneity]]: $f(\alpha x) = abs(\alpha)*f(x)\ \forall\ x \in X\ \&\ \alpha \in \mathbb{R}$
3. Positive Definite: $\forall x \in X, p(x)=0 \rightarrow x=0$
4. Non-negative: $p(x) \ge 0\ \forall\ x \in X$

---
# Examples:
- [[Lp Norm]]
	- [[L1 Norm]]
	- [[L2 Norm]]
	- [[Max Norm]]
- [[Frobenius Norm]] for matricies

----
# Source:
Source
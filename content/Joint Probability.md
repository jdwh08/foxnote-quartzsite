---
aliases: 
tags:
  - stats/probability
edited: 2025-02-15T16:13
created: 2024-03-06T20:21
---
### Definition:
The [[Probability]] that two random events land on a specific value pair.

More formally, given two [[Random Variable]]s X, Y on the same [[Sample Space and Events]] S, the joint probability is the probability that *both* X and Y land on some realized values (x,y).
 $p(x, y) = P(\{\omega \in S: X(\omega)=x, Y(\omega)=y\})$ for all pairs $(x,y) \in \mathcal{X}\times\mathcal{Y}$

A Joint Probability distribution is similar:
$$p(\textbf{X})=p(x_1, x_2, ..., x_d)$$

---
### Notes:
**Conditions for a Joint Distribution**
1. All values $p(x,y)$ must be between 0 and 1, because it's a [[Probability]].
2. It adds to one. $\sum_{(x,y)\in \mathcal{X}\times \mathcal{Y}} p(x,y) = \sum_{x \in \mathcal{X}} \sum_{y \in \mathcal{Y}} p(x,y)=1$

The joint distribution has the most information, so given a Joint Distribution we can work out the [[Marginal Probability]] distributions (by summing), but we can't always do this the other way.
- We would have to have both marginals AND know they are independent.

**Joint Probability Density Function**
Function $\mathbb{R}^2 \rightarrow [0,1]$ so that
$$P[(X,Y) \in A] = \int\int\limits_A f(x,y) \ dx\ dy$$
E.g., if A is a 2d rectangle where $x\in[a,b], y\in[c,d]$, then the bounds on the integrals are $\int\limits_{c}^{d} \int\limits_{a}^{b} f(x,y)\ dx\ dy$.
- Must satisfy all the conditions for [[Probability]], i.e., non-negative, adds up to 1.
- Given the joint PDF $p(x,y)$, we can get marginals by integrating over the other rv.

---
### Examples:
Examples
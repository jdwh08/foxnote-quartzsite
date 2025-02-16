---
aliases: 
tags:
  - stats
edited: 2025-02-15T15:45
created: 2024-03-03T13:47
---
### Definition:
Function which gives the [[Moments of Random Variable]].

In the discrete case, a MGF for [[Random Variable]] X with [[Probability Mass Function]] $p(x)$ is a function $M_x: \mathbb{R} \rightarrow \mathbb{R}$ 
- $M_x(t) = E(e^{tX}) = \sum_{x \in \mathcal{X}} \ e^{tx}p(x) \ \forall t \in \mathbb{R}$

In the continuous case, a MGF for a RV with [[Probability Density Function]] $f(x)$ is 
- $M_x(t) = E[e^{tX}] = \int_{-\infty}^{\infty} e^{tx}f_x(x)dx$

---
### Notes:

Note that MGF is a function of $t$. For a fixed value of $t$, the MGF is the same as the [[Expected Value]] of a function of X $g(X)=e^{tX}$.

**Properties of MGFs:**
- $M_x(0)=1$, since $M_x(0)=E[e^{0*x}]=E[1]=1$. This can be used to check if your function is a valid MGF.
- $M'_x(t)=\frac{\partial}{\partial x} M_x(t) = E[Xe^{tX}]$ (take the sum of the derivatives).
	- Combining the two, we see that $M'_x(0)=E[X*e^{0X}]=E[X]$
- $M^{(2)}_X(t)=E[X^2e^{tX}]$
	- $M_X^{(2)}=E[X^2e^{0X}]=E[X^2]$
- In fact, **the kth moment of $X$ can be generated through the kth derivative of $M_x(t)$**

---
### Examples:
MGF for the [[Geometric Distribution]]:
$M(t) = \sum_{x=1}^{\infty} e^{tx}(1-p)^{x-1}p = \frac{pe^t}{1-e^t(1-p)}$ if $1-e^t(1-p) > 0$
$M(0) = \frac{pe^0}{1-e^0(1-p)}=\frac{p}{p}=1$
$M'(t) = \frac{\partial}{\partial t} (\frac{pe^t}{1-e^t(1-p)}) = \frac{pe^t}{(1-e^t(1-p))^2}$, so $E[X] = M'(0) = \frac{p}{(1-1+p)^2}=\frac{p}{p^2}=\frac{1}{p}$

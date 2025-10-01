---
aliases:
  - PDF
tags:
  - stats/probability
  - stats/distributions
edited: 2025-07-26T12:08
created: 2024-03-03T17:48
---
# Definition:

The function which gets the [[Probability]] of some specific value $x$ in a [[Probability Distribution]].

---
# Notes:

### Definition

The function which gets the [[Probability]] of a [[Random Variable]] being in some tiny band in a [[Probability Distribution]]. 

$$p(x) = \underset{\epsilon \rightarrow0}{\lim \frac{1}{\epsilon}} P(x_0 \le x \le x_0 + \epsilon)$$

**Properties of the PDF:**
1. It must always be nonnegative for all X.
2. The total area under the curve must be one since $\int_{-\infty}^{\infty}f(x)dx = P(-\infty < X < \infty) = 1$

**Interpretation of Density**

Intuition from 3B1B
- Suppose we have $X \sim$ distribution over the reals $\mathbb{R}$.
- What's the probability that $x=1.000000000...$ exactly, and not something slightly different from it? Basically 0
- Thus, for any given value $x, P(X=x)=0$.
- BUT remember we need probabilities to sum up to 1!
- To do this, we define probability as some [[Riemann Integral]] area under a curve. We sum infinitesimally small rectangular areas under that curve and ensure they are 1.
- The "height" of these rectangles is thus determined by the density function, or PDF.
- See also, [[Measure Theory]]. Uh oh.

Theory
- The probability that $X=u$ is $P(X=u) = \int_u^u f(x)dx = 0$. i.e., there are literally NO cases where someone is exactly some value on the real line. The length of a point is nothing.
- Thus, we always consider the probability within some small interval $\delta$: $P(X \in [u, u+\delta]) = \int_u^{u+\delta} f(x)dx$
- The density function $f$ does not need to be less than 1, so long as the area under the curve is always under 1 (e.g., the $\delta$ can be tiny to offset). **Values of the density $f(x)$ are not probabilities! It's the area that is the probability!**
- The density function must be **piecewise continuous**. If it's discontinuous at some countable number of points, it's okay, because the probability of a single point does not matter.

---
# Examples:
Suppose the lifetime of a battery has this PDF:
- 0 if $x<0$
- $ce^{-2x}$ if $x>0$
This is a legitimate PDF if it has integral equal to 1:
$\int_{-\infty}^{\infty} f(x)dx = \int_{-\infty}^{\infty} ce^{-2x}dx = -\frac{c}{2}e^{-2x}|_{t=0}^{t=\infty}=-0-(-\frac{c}{2})$, so $c=2$

The probability the battery lasts from 0.5 to 1 days is:
$P(0.5 < X < 1) = \int_{0.5}^1 f(x)dx = \int_{0.5}^{1}2e^{-2x}dx = -e^{-2x}|_{x=0.5}^{x=1}=e^{-1}-e^{-2}$

---
# Source:
Mitchell 1997
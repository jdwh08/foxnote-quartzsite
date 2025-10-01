---
aliases:
  - Metropolis-Hastings
tags:
  - cs/dsa/optimizers
edited: 2025-07-30T17:16
created: 2024-03-19T22:06
---
# Definition:
A [[Randomized Optimization]] algorithm that slowly decreases the random behaviour over time.

Similar to [[Hill Climbing]], but allow us to occasionally explore instead of always improving.

Demonstrates the [[Multi-armed Bandit]] explore-exploit tradeoff.

Name is inspired by metallurgy --  high strength steel requires repeated heating and cooling ("annealing") to allow molecules to realign.

---
# Notes:

### Algorithm
1. For some range of iterations...
	1. Sample new point $X_i$ in our neighbourhood $N(x)$
	2. Jump to new sample with [[Probability]] given by an "acceptance function": $P(x, x_t, T)$



P(x, x_t, T) = \begin{cases}
1 & f(x_t) \ge f(x) \\
e^{\frac{f(x_t)-f(x)}{T}} & f(x_t) < f(x)
\end{cases}
$



2. Decrease the temperature $T$ (create less randomness)

I.e., we follow [[Hill Climbing]], but sometimes jump anyway with probability given by $e^{({f(x_t)-f(x)})/{T}}$
- Note that if the new point is very close, i.e., $f(x_t)-f(x) \rightarrow -0$ then we go with $e^{-0} \rightarrow 1$
- If the new point is quite far, i.e, $f(x_t)-f(x) << 0$ then we are unlikely to jump.
- High temperature increases randomness, making jumps like
	- $T\rightarrow0$ means this approaches [[Hill Climbing]]
- Low temperature reduces the randomness
	- $T \rightarrow \infty$ means this approaches [[Random Walk]]

##### How do we select temperature $T$?
- Want to decrease $T$ slowly so that it wanders to higher optima before it cools down.

### Properties
1. Temperature controls algorithm behaviour -- either [[Hill Climbing]] or [[Random Walk]]
2. **Probability of ending at some point $x$**  is $\frac{e^{f(x)/T}}{Z_t}$
	1. High temperature makes this probability constant
	2. Low temperature makes weigh high $f(x)$ reward
	3. This is a [[Boltzmann Distribution]] but the notation is different than for Physicists

Related to [[Metropolis-Hastings]]?

---
# Examples:
Examples

----
# Source:
Source
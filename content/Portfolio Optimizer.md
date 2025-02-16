---
aliases: 
tags:
  - ds/ml/ML4T
  - finance
edited: 2025-02-15T16:28
created: 2024-03-19T22:06
---
# Definition:
Given a set of assets and a time period, determine the optimal allocations to maximize some reward function. Reward can be max return, min volatility, Sharpe ratio, etc.

More formally, we frame this as an [[Optimizers]].
- Function $f(x)$ is minimizing negative Sharpe Ratio
- $x$ is the weights (which we also need an initial guess for)
- **Ranges** of weights be between 0-1 (we assume no leverage); this limits search area and makes it faster.
- **Constraints** are equations that must be true; in particular we use $\sum_{i}^{N}abs(x_i) = 1$

---
# Notes:
This is **historical!**
- Though Prof. Balch claims that when we optimize using historical data, it ends up still being better than equal weight.

---
# Examples:
Examples

----
# Source:
Source
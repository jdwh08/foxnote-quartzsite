---
aliases:
tags:
  - ds/ml
edited: 2025-08-28T20:18
created: 2025-01-06T17:40
---
# Definition:
A computer program that
1. learns from some *experience* on some *tasks* according to *performance metric*
2. where *performance* on *tasks* increases with *experience*.

---
# Notes:
Very useful when we cannot create an algorithm (step by step instructions) for a task.
ML uses INDUCTIVE reasoning (reasoning from examples).

### Types:
- [[Supervised Machine Learning]]
- [[Semi-Supervised Machine Learning]]
- [[Unsupervised Machine Learning]]
- [[Reinforcement Learning]]

### The "Machine Learning Recipe"
1. Obtain a dataset.
2. Choose a [[Loss Function]].
3. Choose an [[Optimizer]].
4. Choose a model architecture.

### Challenges
- [[Curse of Dimensionality]]

---
# Examples:

#### [[Linear Regression]]
1. Obtain tabular dataset with $X$ and $y$
2. Use [[Loss Function]] $J(w, b) = -\mathbb{E}_{x,y\sim \hat{p}_{data}} \log \hat{y}(x)$
	1. If we want to do [[Regularization]], we can incorporate L1 or L2 penalty.
3. Specify the model $\hat{y} = w x + b + \epsilon \sim \mathcal{N}(0,1)$
4. Use the [[Optimizer]] of [[Gradient Descent]] (i.e., solve the [[Normal Equations]]), or the closed form solution.

---
# Sources:
This is the (Mitchell 1997) definition.
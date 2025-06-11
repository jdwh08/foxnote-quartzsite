---
aliases: 
tags:
  - ds/ml
edited: 2025-05-14T20:30
created: 2024-04-04T22:33
---
# Definition:

Learn a mapping from inputs to outputs.

- Mapping $f$ (a function)
- Inputs $x \in \mathcal{X}$ are features
	- Often fixed dimension of numbers $\mathcal{X} = \mathbb{R}^D$ (reals of some dimension D)
- Outputs $y \in \mathcal{Y}$ are labels
- Experience is a **Training Set** of $N$ input, output pairs $\mathcal{D} = {(x_n, y_n)}|_{n=1}^{N}$
	- $N$ is sample size.
- Performance metric $\mathcal{P}$ depends on the task.

---
# Notes:
Most common form of [[Machine Learning]].


#### Assumptions
We make the following assumption:
1. Well behaved function
2. Representative data
3. Which is able to be generalized
	1. We are using induction (specific examples to general rule)

---
# Examples:
[[Classification]]

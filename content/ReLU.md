---
aliases:
tags:
  - ds/ml/nn/activation
edited: 2025-09-03T20:19
created: 2024-03-19T22:06
---
# Definition:
An [[Activation Function]] which is zero for negative values and identity for positive values.
$$ReLU = \max(0, z)$$

---
# Notes:

Provides nice gradient flow as opposed to [[Sigmoid Function]], since it doesn't have issues with vanishing/exploding gradients.

### Issues
"Dying ReLU" problem, where if values are too negative the resulting gradients are always in the zero region and thus the neuron is essentially dead.

### [[Gradient]]:
$$\nabla ReLU = \begin{cases}
	0 \text{ if } x \le 0 \\
	1 \text{ if } x > 0
\end{cases}$$
Technically there is a discontinuity but by convention this is set to zero.

As a [[Jacobian]]: 
- It is a [[Diagonal Matrix]], since changing $x_i$ has no impact on $x_j$
- It's also zero if inputs are negative.

### Weight Initialization:
- Set the bias terms to be small positive values like 0.1 so they are initially active.

### Modifications and Alternatives
- [[Leaky ReLU]]: Set the output to be $\max(0, z) - \alpha \min(0,z)$, so that highly negative values still have some small influence via $\alpha$.
- [[Maxout]]

---
# Examples:
Examples

----
# Source:
GaTech DL
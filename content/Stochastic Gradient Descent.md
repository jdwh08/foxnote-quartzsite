---
aliases:
tags:
  - ds/ml
edited: 2025-08-28T19:45
created: 2024-03-19T22:06
---
# Definition:
A variant of [[Gradient Descent]] where we conduct gradient descent using a small mini-batch of examples, rather than the full examples.

---
# Notes:

### Formal
If we have some [[Loss Function]] which is additive, e.g., [[Log Likelihood]] ($L=\log p(y|x,w)$):
$$J(\textbf{w}) = \mathbb{E}_{\textbf{x}, y \sim \hat{p}} L(\textbf{x}, y, \textbf{w}) = -\frac{1}{n} \sum_{i}^n L(\textbf{x}_i, y_i, w)$$
We can then get the [[Gradient]] for [[Gradient Descent]] of the [[Jacobian]]:
$$\nabla J(\textbf{w}) = \frac{1}{n} \sum_{i}^n \nabla_{w} L(x, y, w)$$
but note that we don't have to have $n$ be the same as the data size for this to still be valid!

Take samples randomly from [[Uniform Distribution]], and do [[Gradient Descent]] on that small batch.
$$w' = w - \eta \nabla$$

### Properties
- Batch size is **fixed** generally.
- Needs a smaller learning rate $\eta$ than regular gradient descent.
- Might be able to avoid local minima because it uses the gradients.
- Works when the [[Loss Function]] can be decomposed as some sum across training examples.

##### Selecting Batch Size
- 

---
# Examples:


----
# Source:
Source
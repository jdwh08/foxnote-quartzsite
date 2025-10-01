---
aliases:
tags:
  - math/calculus
  - math/linear_algebra
edited: 2025-08-27T23:45
created: 2024-03-19T22:06
---
# Definition:

The [[Partial Derivative]] of a function going from $\mathbb{R}^n \rightarrow \mathbb{R}^1$ for each of its $n$ inputs.



\nabla = \begin{bmatrix} \frac{\partial f}{\partial x_1} & \frac{\partial f}{\partial x_2} & ... & \frac{\partial f}{\partial x_n} \end{bmatrix}$



---
# Notes:

### Calculation Methods
1. Manual: [[Calculus]] and [[Derivative]] by hand. Annoying.
2. Symbolic: Doesn't work for all function types.
3. Numerical: Approximate with definition of derivative. Works but is computationally intensive.
4. Automatic: This is what PyTorch does.
	1. Manually derive the partial derivatives for functions

### Use Cases
In #ds/ml :
- [[Gradient Descent]]
- [[Gradient Boosting]]

---
# Examples:

### A basic example
Suppose we have $f(x, w) = w^T x$, and [[Mean Squared Error]] loss so $L=(y-w^T x)^2$.
We can get the gradient using the [[Chain Rule]]:
1. $\frac{\partial L}{\partial w_j} = \sum_i^{N} \frac{\partial L}{\partial w_j} (y_i-w^T x_i)^2 = \sum 2 (y_i - w^T x_i)$  

----
# Source:
Source
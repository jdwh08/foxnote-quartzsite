---
aliases:
tags:
  - math/calculus
  - math/linear_algebra
edited: 2025-08-26T22:34
created: 2024-03-19T22:06
---
# Definition:
The matrix of second [[Partial Derivative]] for some function $f$ going from $\mathbb{R}^N \rightarrow \mathbb{R}^1$, where each value $(i,j) = \frac{\partial ^ 2 f(\textbf{x})}{\partial x_i x_j}$

$$H(x) = \begin{bmatrix} 
\frac{\partial f_1}{\partial x_1^2} & \frac{\partial f_1}{\partial x_1 \partial x_2} & ... & \frac{\partial f_1}{\partial x_1 \partial x_n} \\
\frac{\partial f_2}{\partial x_2 \partial x_1} & \frac{\partial f_2}{\partial x_2^2} & ... & \frac{\partial f_2}{\partial x_2 \partial x_n} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial f_m}{\partial x_n \partial x_1} & \frac{\partial f_m}{\partial x_n \partial x_2} & ... & \frac{\partial f_m}{\partial x_n^2} \\
\end{bmatrix}$$

---
# Notes:
- Kinda like the second derivative when the [[Jacobian]] is the first derivative
- But watch the dimensions!

- Equivalent to the Transpose of the [[Jacobian]] of the [[Gradient]].
$$H(f(x)) = J \left(\nabla f(x) \right)^T$$

---
# Examples:
Examples

----
# Source:
Source
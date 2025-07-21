---
aliases: 
tags:
  - math/calculus
  - math/linear_algebra
edited: 2025-06-13T20:39
created: 2024-03-19T22:06
---
# Definition:
The matrix of second [[Partial Derivative]] for some function $f$ going from $\mathbb{R}^N \rightarrow \mathbb{R}^1$.
Kinda like the second derivative when the [[Jacobian]] is the first derivative.

---
# Notes:

$$H(x) = \begin{bmatrix} 
\frac{\partial f_1}{\partial x_1^2} & \frac{\partial f_1}{\partial x_1 \partial x_2} & ... & \frac{\partial f_1}{\partial x_1 \partial x_n} \\
\frac{\partial f_2}{\partial x_2 \partial x_1} & \frac{\partial f_2}{\partial x_2^2} & ... & \frac{\partial f_2}{\partial x_2 \partial x_n} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial f_m}{\partial x_n \partial x_1} & \frac{\partial f_m}{\partial x_n \partial x_2} & ... & \frac{\partial f_m}{\partial x_n^2} \\
\end{bmatrix}$$

---
# Examples:
Examples

----
# Source:
Source
---
aliases:
tags:
  - math/calculus
  - math/linear_algebra
edited: 2025-09-06T14:36
created: 2024-03-19T22:06
---
# Definition:
The matrix of second [[Partial Derivative]] for some function $f$ going from $\mathbb{R}^N \rightarrow \mathbb{R}^1$, where each value $(i,j) = \frac{\partial ^ 2 f(\textbf{x})}{\partial x_i x_j}$



..H(x) = \begin{bmatrix} 
\frac{\partial f_1}{\partial x_1^2} & \frac{\partial f_1}{\partial x_1 \partial x_2} & ... & \frac{\partial f_1}{\partial x_1 \partial x_n} \\
\frac{\partial f_2}{\partial x_2 \partial x_1} & \frac{\partial f_2}{\partial x_2^2} & ... & \frac{\partial f_2}{\partial x_2 \partial x_n} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial f_m}{\partial x_n \partial x_1} & \frac{\partial f_m}{\partial x_n \partial x_2} & ... & \frac{\partial f_m}{\partial x_n^2} \\
\end{bmatrix}$



---
# Notes:
- Kinda like the second derivative when the [[Jacobian]] is the first derivative.
- But watch the dimensions!

- Equivalent to the Transpose of the [[Jacobian]] of the [[Gradient]].


..H(f(x)) = J \left(\nabla f(x) \right)^T$



### Properties
- If $f$ is [[Continuous Function]], then the matrix is equal to its [[Matrix Transpose]], i.e., order of differentiation can be swapped.

### Geometric Interpretation
- Measures the curvature of the function. 
	- 0: No curve.
	- Negative: [[Convex Function]]
	- Positive: [[Concave Function]]

### Use Cases
- Analogous to the second [[Derivative]], so can be used in [[Second Derivative Test]].
	- NOTE: we also have the option for [[Saddle Points]] if value is zero, e.g., we have a mixture of convex and concave based on $x$ inputs.

- Useful as a second-order optimizer like in [[Newton-Raphson]] method. We can create a second-order [[Taylor Series]] expansion. Note that $x_0$ here is the current point. If we have a [[Learning Rate]], then the new point $x = x_0-\epsilon \nabla$


..f(x) \approx f(x_0) + (x-x_0)^T\nabla_x + 1/2 (x-x_0)^T H (x-x_0)$




..f(x) \approx f(x_0) - \epsilon \nabla_x^T \nabla_x + 1/2 \epsilon^2 \nabla_x^T H_x \nabla_x$




---
# Examples:
Examples

----
# Source:
- GaTech DL
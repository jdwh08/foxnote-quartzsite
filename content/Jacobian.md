---
aliases: 
tags:
  - math/calculus
  - math/linear_algebra
edited: 2025-02-15T16:38
created: 2024-04-28T20:33
---
### Definition:
A matrix that stores the partial derivatives of a function that goes from $\mathbb{R}^n \rightarrow \mathbb{R}^m$.

Often confused with [[Gradient]], which is a matrix that stores the partial derivatives of a function going to $R^1$.

---
### Notes:
Notes

---
### Examples:
Suppose we have function: $$f(x,y) = \begin{bmatrix} 2x+y^3 \\ -13x + e^y \end{bmatrix}$$Notice how this function is $\mathbb{R}^2 \rightarrow \mathbb{R}^2$.

Let's break this up into two scalar functions, and calculate gradients individually:$$f_1(x,y) = 2x+y^3,\ \  f_2(x,y)=-13x+e^y$$ Now, we'll get the gradients separately.$$\nabla f_1 = \begin{bmatrix} 2 \\ 3y^2 \end{bmatrix}, \ \ \nabla f_2 = \begin{bmatrix} -13 \\ e^y \end{bmatrix}$$ Finally, we'll assemble these partials into a Jacobian. $$J = \begin{bmatrix} 
' & \partial x & \partial y \\ 
\partial f_1 & 2 & 3y^2 \\
\partial f_2 & -13 & e^y
\end{bmatrix}$$ (it's basically the transposed gradients per equation!)
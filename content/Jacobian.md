---
aliases:
tags:
  - math/calculus
  - math/linear_algebra
edited: 2025-08-29T17:30
created: 2024-04-28T20:33
---
### Definition:
A matrix that stores the [[Partial Derivative]] of a set of functions that goes from $\mathbb{R}^n \rightarrow \mathbb{R}^m$.



J(x) = \begin{bmatrix} 
\frac{\partial f_1}{\partial x_1} & \frac{\partial f_1}{\partial x_2} & ... & \frac{\partial f_1}{\partial x_n} \\
\frac{\partial f_2}{\partial x_1} & \frac{\partial f_2}{\partial x_2} & ... & \frac{\partial f_2}{\partial x_n} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial f_m}{\partial x_1} & \frac{\partial f_m}{\partial x_2} & ... & \frac{\partial f_m}{\partial x_n} \\
\end{bmatrix}$


---
### Notes:

Often confused with [[Gradient]], which is a special case with one function going from  $\mathbb{R}^n \rightarrow \mathbb{R}^1$.
- Think about the Jacobian as having a Gradient in each row for each function.



J(x) = \begin{bmatrix} \nabla f_1(x) \\ \nabla f_2(x) \\ \vdots\end{bmatrix}$



### Handling Elemental Operators
Things like $\max(x_1, x_2)$ or $x_1 + x_2$ or $x_1 x_2$.

This is basically 


---
### Examples:
Suppose we have function: 

f(x,y) = \begin{bmatrix} 2x+y^3 \\ -13x + e^y \end{bmatrix}$

Notice how this function is $\mathbb{R}^2 \rightarrow \mathbb{R}^2$.

Let's break this up into two scalar functions, and calculate gradients individually:

f_1(x,y) = 2x+y^3,\ \  f_2(x,y)=-13x+e^y$

 Now, we'll get the gradients separately.

\nabla f_1 = \begin{bmatrix} 2 \\ 3y^2 \end{bmatrix}, \ \ \nabla f_2 = \begin{bmatrix} -13 \\ e^y \end{bmatrix}$

 Finally, we'll assemble these partials into a Jacobian. 

J = \begin{bmatrix} 
 & \partial x & \partial y \\ 
\partial f_1 & 2 & 3y^2 \\
\partial f_2 & -13 & e^y
\end{bmatrix} = 
\begin{bmatrix}
2 & 3y^2 \\
-13 & e^y
\end{bmatrix}
$

 (it's basically the [[Matrix Transpose]] of [[Gradient]] per equation!)
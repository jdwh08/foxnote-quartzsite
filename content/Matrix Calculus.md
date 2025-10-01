---
aliases:
tags:
  - math/calculus
  - math/linear_algebra
edited: 2025-09-28T20:53
created: 2024-03-19T22:06
---
# Definition:
A type of [[Calculus]] which is done on [[Matrix]].

---
# Notes:
### Types:
- [[Gradient]]
- [[Jacobian]]
- [[Hessian]]

### Layout and Notation
There are two types: **Numerator Notation** and **Denominator Notation**.
- In numerator / [[Jacobian]] style notation
	- Each output $y$ be a row, and each input $x$ be a column.
	- This makes the shapes the [[Matrix Transpose]] of the input.
- In denominator / [[Hessian]] style notation
	- Each output $y$ be a column, and each input $x$ be a row.
	- This makes the shapes the same dimensions as the input, which is nice and intuitive.

- Typically we will use whatever makes the shapes consistent and work out.
- Generally we default to Numerator Notation.

### Rules
##### Binary Operators
Stuff that takes two values (or functions), e.g., $+, -, *, /, \max, \min, ...$:
- Suppose we have two function/values, $f(\textbf{w})$ and $g(\textbf{x})$, which are combined together with one of the above represented by $\blacksquare$:


..\begin{bmatrix} y_0 \\ y_1 \\ y_2 \\ \vdots \end{bmatrix} = \begin{bmatrix} f_0(\textbf{w}) \blacksquare g_0(\textbf{x}) \\ f_1(\textbf{w}) \blacksquare g_1(\textbf{x}) \\ f_2(\textbf{w}) \blacksquare g_2(\textbf{x}) \\ \vdots \end{bmatrix}$



We can then take the derivative [[Gradient]] within each $y$ row, i.e., the [[Jacobian]]:


..J_w = \frac{\partial y}{\partial w} = \begin{bmatrix} \partial/\partial w_0 \left[ f_0(\textbf{w}) \blacksquare g_0(\textbf{x}) \right] & \partial/\partial w_1 \left[ f_0(\textbf{w}) \blacksquare g_0(\textbf{x}) \right] & ... \\
\partial/\partial w_0 \left[f_1(\textbf{w}) \blacksquare g_1(\textbf{x}) \right] & \partial/\partial w_1 \left[f_1(\textbf{w}) \blacksquare g_1(\textbf{x}) \right] & ...\\
\partial/\partial w_0 \left[f_2(\textbf{w}) \blacksquare g_2(\textbf{x}) \right] & \partial/\partial w_1 \left[f_2(\textbf{w}) \blacksquare g_2(\textbf{x}) \right] & ...\\
\vdots & \vdots & \ddots \end{bmatrix}$



This is in **Numerator Notation** since our $f_0$ is in row $0$ as opposed to column 0.


- For [[Diagonal Matrix]], notice that the off-diagonal stuff $i \neq j$ $\frac{\partial}{\partial w_j} f_i(w)$ is a constant with respect to $w_j$, and thus zeros. 

| Operation                        | Partial X (Diag, Off)                                                                        | Partial W (Diag, Off)                                                                             | X             | W                  |
| -------------------------------- | -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ------------- | ------------------ |
| $x+w$                            | $\frac{\partial (x_i+w_i)}{\partial x_i}=1$, $\frac{\partial (x_i+w_i)}{\partial x_j}=0$     | $\frac{\partial (x_i+w_i)}{\partial w_i}=1$, $\frac{\partial (x_i+w_i)}{\partial w_j}=0$          | $diag(1)$     | $diag(1)$          |
| $x-w$                            | $\frac{\partial (x_i-w_i)}{\partial x_i}=1$, $\frac{\partial (x_i-w_i)}{\partial x_j}=0$     | $\frac{\partial (x_i-w_i)}{\partial w_i}=-1$, $\frac{\partial (x_i-w_i)}{\partial w_j}=0$         | $diag(1)$     | $diag(-1)$         |
| $x \odot w$ [[Hadamard Product]] | $\frac{\partial (x_i * w_i)}{\partial x_i}=w_i$, $\frac{\partial (x_i*w_i)}{\partial x_j}=0$ | $\frac{\partial (x_i*w_i)}{\partial w_i}=x_i$, $\frac{\partial (x_i*w_i)}{\partial w_j}=0$        | $diag(w_i)$   | $diag(x_i)$        |
| $x \odot 1/w$                    | $\frac{\partial (x_i/w_i)}{\partial x_i}=1/w_i$, $\frac{\partial (x_i/w_i)}{\partial x_j}=0$ | $\frac{\partial (x_i/w_i)}{\partial w_i}=-x_i/w_i^2$, $\frac{\partial (x_i/w_i)}{\partial w_j}=0$ | $diag(1/w_i)$ | $diag(-x_i/w_i^2)$ |

- If our $x$ or $w$ are scalars, then these same rules apply.

##### Summation
We can apply the same stuff:
- $y=\sum(x_i) \rightarrow [\frac{\partial y}{\partial x_0}, ...]$

##### Chain Rule
![[_Media/Excalidraw/Chain Rule#For Matrix Calculus]]

---
# Examples:


----
# Source:
[Answers.ai Matrix Calculus Parr Howard 2018](https://doi.org/10.48550/arXiv.1802.01528)

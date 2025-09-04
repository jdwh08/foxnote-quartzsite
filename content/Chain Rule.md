---
aliases:
tags:
  - math/calculus
edited: 2025-08-30T15:29
created: 2024-03-19T22:06
---
# Definition:
A [[Derivative Rules|derivative rule]] for taking the [[Derivative]] of nested functions $y=f(g(x))$.
$$\frac{dy}{dx} = \frac{df}{dg}*\frac{dg}{dx}$$

---
# Notes:
A nice shorthand for remembering this particularly for [[Matrix Calculus]] is:
1. Replace nested functions with intermediate placeholders, e.g., $u=g(x)$, $y=f(u)$
2. Compute each derivative individually $\frac{du}{dx}, \frac{dy}{du}$
	1. This includes multi-input stuff where our changer $x$ impacts the function $f$ in multiple ways
	2. e.g., $\partial u(x, v) / \partial x = \partial u/ \partial x * \partial x / \partial x + \partial u / \partial v * \partial v / \partial x$
3. Combine individual derivatives together
4. Substitute so intermediate placeholders are replaced by the function in terms of $x$.

### For [[Matrix Calculus]]
$$\frac{\partial}{\partial \textbf{x}} f(g(\textbf{x})) = 
\begin{bmatrix} 
\partial f_1 / \partial g_1 & \partial f_1 / \partial g_2 & ... & \partial f_1 / \partial g_k\\
\partial f_2 / \partial g_1 & \partial f_2 / \partial g_2 & ... & \partial f_2 / \partial g_k\\
\vdots & \vdots & \ddots & \vdots \\
\partial f_m / \partial g_1 & \partial f_m / \partial g_2  & ... & \partial f_m / \partial g_k\\
\end{bmatrix}
\begin{bmatrix} 
\partial g_1 / \partial x_1 & \partial g_1 / \partial x_2 & ... & \partial g_1 / \partial x_n\\
\partial g_2 / \partial x_1 & \partial g_2 / \partial x_2 & ... & \partial g_2 / \partial x_n\\
\vdots & \vdots & \ddots & \vdots \\
\partial g_k / \partial x_1 & \partial g_k / \partial x_2 & ... & \partial g_k / \partial x_n\\
\end{bmatrix}$$

where $f$ and $g$ are functions which are
- $f: m \times k$  (transforms $k \rightarrow m$)
- $g: k \times n$ (transforms $n \rightarrow k$)
- Result: $m \times n$ (transforms $n \rightarrow m$)

Notice how due to the definition of [[Matrix Product|Matrix Multiplication]], each term gets $(\partial f_1 / \partial g_1 * \partial g_1 / \partial x_1) + (\partial f_1 / \partial g_2 * \partial g_2 / \partial x_1) + ...$

which exactly lines up with the chain rule for single variables.

---
# Examples:

### A Basic Chain Rule
$$y = f (x) = \log(\sin(x^3)^2)$$
We do placeholders:
- $u_1=x^3$
- $u_2 = \sin (u_1)$
- $u_3 = (u_2)^2$
- $u_4 = \log(u_3) = y$

We compute derivatives
- $du_1 / x= 3x^2$
- $du_2 / u_1= \cos(u_1)$
- $du_3 / u_2 = 2(u_2)$
- $du_4 / u_3 = 1/u_3$

We combine and substitute
$$dy/dx = 1/u_3 * 2(u_2) * \cos(u_1) * 3x^2$$
$$dy/dx = \frac{2\sin(x^3) * \cos(x^3) * 3x^2}{\sin(x^3)^2} = \frac{6x^2 \cos(x^3)}{\sin(x^3)}$$

### Multivariate Input Functions
$$f(x) = \sin(x + x^2)$$
- $u_0 = \sin(u_1)$
- $u_1 = u_{2A} + u_{2B}$
- $u_{2A} = x$
- $u_{2B} = x^2$

Partials:
- $\partial u_0 / \partial u_1 = \cos(u_1)$
- $\partial u_1 / \partial u_{2A} = 1, \partial u_1 / \partial u_{2B} = 1$
- $\partial u_{2A} / \partial x = 1$
- $\partial u_{2B} / \partial x = 2x$
- $\partial u_1 / \partial x = 1*1 + 1*2x$

$$\partial f / \partial x = \cos(u_1) * (1+2x) = \cos(x+x^2)*(1+2x)$$

### Vector Chain Rule with [[Jacobian]]
$$\begin{bmatrix} y_1 \\ y_2 \end{bmatrix} = \begin{bmatrix} f_1(x) \\ f_2(x) \end{bmatrix} = \begin{bmatrix} \ln(x^2) \\ \sin(3x) \end{bmatrix}$$

Do substitutions:
$g = \begin{bmatrix} x^2 \\ 3x \end{bmatrix}, \begin{bmatrix} f_1(x) \\ f_2(x) \end{bmatrix} = \begin{bmatrix} \ln(g_1) \\ \sin(g_2) \end{bmatrix}$

----
# Source:
[Matrix Calculus for Deep Learning](https://arxiv.org/pdf/1802.01528) (a good refresher)

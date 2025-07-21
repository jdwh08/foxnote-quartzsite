---
aliases: 
tags:
  - cs/dsa/optimizers
  - math/calculus
edited: 2025-06-13T20:39
created: 2024-03-19T22:06
---
# Definition:
A method to find the zero values of a function in the reals $\mathbb{R}$, by picking an initial guess and then repeatedly solving:

$$x_{t+1} = x_{t} - \frac{f(x_t)}{f'(x_t)}$$

---
# Notes:

### Intuition:
Given some function $f\ \mathbb{R} \rightarrow \mathbb{R}$, we can approximate it at some point $x$ with a [[Tangent]] line:
$$f(x) \approx f(x_t) + f'(x_t)(x-x_t)$$

![[Newton-Raphson.excalidraw.png.png]]

Solve for $x$ in that function to get our approximation.
Repeat.

### Multivariate Case

$$\hat{x}_{t+1} = x_t - J^{-1} f(x)$$
where $J^{-1}$ is the [[Jacobian]] and $f(x)$ is the original function.

#### As an [[Optimizer]]
We want to find where the [[Gradient]] is zero, i.e., our function $f(x) = \nabla$. Thus,

$$\hat{x}_{t+1}=x_t-H^{-1}(x_t) \nabla f(x_t)$$
Where $H^{-1}$ is the [[Matrix Inverse]] of the [[Hessian]] and $\nabla$ is the [[Gradient]].

### Issues
1. Requires knowing how to calculate the [[Derivative]]
2. Does not converge if
	1. Initial $f'(x_0)=0$ around the starting region $x_0$
	2. Second derivative $f''(x)$ is not continuous in the region around $x_0$
3. Can have issues with multiple roots near each other (like in the graph), or oscillating between roots


---
# Examples:
Examples

----
# Source:
Source
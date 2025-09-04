---
aliases: 
tags:
  - ds/ml/svm
edited: 2025-07-26T14:09
created: 2024-03-19T22:06
---
# Definition:
Applying a transformation (called a kernel) to the data to allow ML models to operate in a larger space.

Especially useful in [[Support Vector Machines]], where we can create linear separation in this larger space which translates to non-linear separation in the feature space.

---
# Notes:
Kernels don't actually compute what the points would be in higher dimensional space, but rather what the distance would be, which is cheaper.

#### Common Choices For [[Support Vector Machines]]:
We can apply a non-linear transformation to all the data points. 
- [[Dot Product]] between data $x$ and others $y$. $f(x)^{T} f(y) := k(x, y)$ 
- Linear Kernel: $f(x) = x \rightarrow k(x, y)=x'y$. Direct linear.
- Polynomial Kernel: $f(x) = x_1, x_2, x_1 x_2, x_1^2, x_2^2 \rightarrow k(x, y)=(x'y+c)^P$
	- Also considers the interaction between the data (e.g., $x_1y_1$)
	- Allows curved decision boundaries.
- Tanh: Looks kinda like sigmoid
	- $k(x,y) = \tanh(\alpha x' y + \theta)$
- Radial Basis Function (RBF) Kernel: $f(x) = ?(\infty \text{dim})? \rightarrow k(x, x')=e^{-\gamma * ||x-x'||^2}$
	- This one needs infinite dimensions
	- It's basically like a [[Normal Distribution]] around each point.

#### Mercer Condition
For the math to be guaranteed to work, the kernel must act like a [[Distance Measure]], i.e., a [[Symmetric Matrix]] which is [[Positive Semidefinite Matrix]]. In practice, you can probably get away with this.

---
# Examples:

**Circular Kernel**
- We create a function $\Phi(q)$ which converts our data into a higher dimension! $\Phi(q_1, q_2)\rightarrow (q_1^2, q_2^2, \sqrt{2}q_1q_2)$
- Our dot product $x_i' x_j$ becomes $x_1^2 y_1^2 + x_2^2 y_2^2 + 2x_1 x_2 y_1 y_2 = (x_1 y_1 + x_2 y_2)^2 = (x'y)^2$
- Notice how this is a Circle!
- We've exploited the **similar in direction** to become circle-like!
- This was also carefully chosen so that it is still the [[Dot Product]].
![[Kernel Trick Circle.excalidraw.png.png|369x482]]

----
# Source:
The Kernel Trick in SVMs https://www.youtube.com/watch?v=Q7vT0--5VII

---
aliases:
tags:
  - math
edited: 2025-08-19T21:48
created: 2024-03-19T22:06
---
# Definition:
A function where the "middle" between two points are at least as large as the value of the function in the middle. 

We can draw the function as a U shape, connect two points on the function as a line segment, and see the middle is greater than the function.

The opposite is a [[Concave Function]].

---
# Notes:

### Formal Definitions

We can use [[Jensen's Inequality]] to properly define this:


..f \left(\lambda x + (1-\lambda)y \right) \le \lambda f(x) + (1-\lambda) f(y)$



We can also write this in terms of the [[Gradient]], aka, as a [[Tangent]] line or plane:


..f(x) \ge f(y) + \nabla f(y) * (x-y)$



###### Tiny Proof of Tangent Version
1. Fix $y$ to be some point.
2. Let there be some $z = \lambda x + (1-\lambda) y$. This means that $f(z) \le \lambda f(x) + (1-\lambda) f(y)$. 
3. Rearrange this to be $\frac{f(z)-f(y)}{\lambda} = \frac{f(\lambda x + (1-\lambda) y)-f(y)}{\lambda} \le f(x)-f(y)$
4. Take the [[Limit]] as $\lambda \rightarrow 0^{+}$. The left bit becomes the definition of the [[Derivative]] from $\rightarrow^{+}$, i.e., $f'(y)*(x-y)$. 
	1. We can pull out the $(x-y)$ from the left, giving a clean limit definition.
5. Finally, this gives that $f(x) \ge f(y) f'(y) *(x-y)$, which in higher dimensions translates to the [[Gradient]]. 

### Proofs
- [[Second Derivative Test]]
	- The [[Hessian]] is [[Positive Semidefinite Matrix]] is the equivalent way in [[Matrix Calculus]]

### Usefulness

- [[Optimizer]]s and optimization work really well on smooth convex functions because they have a nice gentle path to a single minimum. 
	- Gradient Descent!

---
# Examples:
Examples

----
# Source:
Source
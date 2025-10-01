---
aliases:
tags:
  - math/linear_algebra
edited: 2025-08-26T21:40
created: 2024-03-19T22:06
---
# Definition:
A type of [[Matrix Decomposition]] which breaks matrices down into [[Eigenvectors and Eigenvalues]], i.e., a set of vectors which keep their direction after the linear transformation.



..A=V\ \text{diag}(\lambda) \ V^{-1}$



---
# Notes:

### Formal Definition
Suppose we break our matrix $A$ down into [[Eigenvectors and Eigenvalues]].

We can combine the eigenvectors together into a matrix $V$. This can decompose the matrix A into our eigenvector matrix $V$, a [[Diagonal Matrix]] of the eigenvalues, and then the inverse of the eigenvector matrix $V^{-1}$.

### Geometric Interpretation


### Strang


### Requirements
1. Must be a [[Square Matrix]].

### Properties
1. [[Singular Matrix]]: IFF any eigenvalue is zero.

### Uses
1. Optimization for quadratic functions like $f(x) = x^T A x$ subject to $||x||_2 = 1$

### Example Cases
- Simple case: real value [[Symmetric Matrix]]
	- Can always decompose this into $A=Q \Lambda Q^T$, where $Q$ has real values and $\Lambda$ is $diag(\lambda)$ matrix.
	- Might not be unique, e.g., two eigenvectors having same eigenvalue.
	- Typically sort by $\lambda$ eigenvalues in descending order.

### Alternatives
1. [[Singular Value Decomposition]]: a more general form for non-square matricies

---
# Examples:
Examples

----
# Source:
Source
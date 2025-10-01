---
aliases:
tags:
  - math/linear_algebra
edited: 2025-08-21T18:27
created: 2024-03-19T22:06
---
# Definition:
A matrix $A^{-1}$ such that the [[Matrix Product]] with the original [[Matrix]] results in the [[Identity Matrix]]. 


AA^{-1} = I \ \text{(left)}\ \ \ |\ \ \ A^{-1}A = I\ \text{(right)}$



---
# Notes:

### Requirements for the Matrix Inverse to Exist:
Suppose the matrix is a transformation onto $\mathbb{R}^m$. Then...

1. There must be some set of at least $m$ non-[[Linear Dependence|linearly dependent]] columns. [[Matrix Rank]] is at least $m$.
	1. Otherwise, we map multiple values to the same point and lose identification.
2. For all $b$, there exists at most one solution to $Ax = b$.
	1. This means we need to have at most $m$ linearly independent columns. If we have more than $m$, we have multiple matrices which work and lose identification.
3. This implies that our matrix is a [[Square Matrix]] of shape $m \times m$.

### Properties
For [[Square Matrix]], the left and right matrix inverse are the same.

---
# Examples:
Examples

----
# Source:
Source
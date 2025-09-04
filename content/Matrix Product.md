---
aliases:
  - Matrix Multiplication
tags:
  - math/linear_algebra
edited: 2025-08-21T18:48
created: 2024-03-19T22:06
---
# Definition:
The product of two [[Matrix]]. 

$$A^{(m \times n)}B^{(n \times o)} =C^{(m \times o)}$$

We preserve the outer dimensions (m and o), but the inner dimension (n) has to line up.

The inner elements are defined as $C_{i,j} = \sum_k A_{i,k} B_{k_j}$.

---
# Notes:

### Properties
- [[Associative]]: $A(BC) = (AB)C$
- [[Distributive]]: $A(B+C) = AB + AC$
- NOT [[Commutative]]!!!! $AB \neq BA$.

### Comparisons to Other Products
We can also think of this as taking the [[Dot Product]] between the row vector $A_i$ and column vector $B_j$.

This is different from element-wise multiplication with the [[Hadamard Product]] $C_{i,j} = A_{i,j} B_{i,j}$.



---
# Examples:
Examples

----
# Source:
Source
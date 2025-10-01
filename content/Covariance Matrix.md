---
aliases: 
tags:
  - math/linear_algebra
  - stats/probability
edited: 2025-02-15T16:26
created: 2024-03-29T22:17
---
### Definition:
A square matrix which captures the [[Covariance]] and [[Variance]] between the variables.

Consider some variables $A, B, C, ...$ and consider a matrix whose elements are as follows:


..\begin{bmatrix}
 & A & B & C & ... \\
A & cov(a,a) & cov(a,b) & cov(a,c) & ... \\
B & cov(b,a) & cov(b,b) & cov(b,c) & ... \\
C & cov(c,a) & cov(c,b) & cov(c,c) & ... \\
... & ... & ... & ... & ...\\
\end{bmatrix}$


Note that $cov(a,a) = Var(a)$, and $cov(a,b) = cov(b,a)$ so this is a [[Symmetric Matrix]].

---
### Notes:
Formula as 

---
### Examples:
Examples
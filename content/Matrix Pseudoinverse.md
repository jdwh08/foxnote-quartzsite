---
aliases:
  - Moore-Penrose Pseudoinverse
tags:
  - math/linear_algebra
edited: 2025-08-26T21:42
created: 2024-03-19T22:06
---
# Definition:
A [[Matrix Inverse]] approximation for matrices which are not [[Square Matrix]].

---
# Notes:

### Formal Problem
Suppose we are trying to solve $Ax = b$. 

This can be Over- or Under- determined when we have more or fewer equations than variables, i.e., non-square matrix. To fix this, we need some new options.
- More rows than columns:
	- This is like a [[Linear Regression]] with too much data. 
	- We find the closest possible value which minimizes [[L2 Norm]] $||Ax-y||_2$
- More columns than rows:
	- This is like a Linear regression with not enough data, i.e., lack of identification. 
	- We have a range of possible options. This finds one minimizing the $||x||_2$ norm.

Formally speaking, the Moore-Penrose Psuedoinverse is 


..A^+ = \lim (A^TA+\alpha I)^{-1} A^T = \lim A^T (AA^T+\alpha I)$


### Properties

##### Penrose Properties
To be a good inverse, our pseudoinverse must adhere to the following:
1. $AA^+A=A$. Maps column vectors back to themselves.
2. $A^+ A A^+ = A^+$. Is a Weak Invese.
3. $(A A^+)^* = AA^+$. Is a [[Hermitian Matrix]].
4. $(A^+A)^* = A^+A$. Is a [[Hermitian Matrix]].
##### Other Properties
- This pseudoinverse is *unique*!

### Geometric Interpretation
1. Project $b$ onto column space of $A$ to find best fit.
2. Find the solution in the row space of $A$ which has smallest [[L2 Norm]].

### Solving
We solve this $A^+$ with the [[Singular Value Decomposition]]. Stable & practical.
1. Get the SVD $A= U \Sigma V^T$.
2. Invert the non-zero singular values $\Sigma$ so that $\sigma_i \rightarrow 1/\sigma_i$.

### Usage
- [[Linear Regression]].
- [[Principal Component Analysis]].
- Solving Least-Squares Control Problems.

---
# Examples:

### Trivial Diagonal Matrix
Suppose we have the following [[Diagonal Matrix]]:


..A = \begin{bmatrix} 
2 & 0 \\
0 & 1 \\
\end{bmatrix}$



We can apply a [[Singular Value Decomposition|SVD]]! Note that because it's diagonal, our singular values are just the matrix, so $\Sigma=A$ and the SVD is $U \Sigma V = I A I$. 
This means that $\Sigma^{-1}$ is the reciprocal of the diagonal values (off diagonals get turned to zero), thus



..\Sigma^{-1} = \begin{bmatrix} 
1/2 & 0 \\
0 & 1 \\
\end{bmatrix} = A^{-1}$



### Basic 2x2 Matrix


----
# Source:
Source
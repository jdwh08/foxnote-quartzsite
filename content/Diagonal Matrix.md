---
aliases:
tags:
  - math/linear_algebra
edited: 2025-08-21T18:50
created: 2024-03-19T22:06
---
# Definition:
A [[Matrix]] which only has values along the main diagonal, with everything else being zero.



..D =\begin{bmatrix} 
x_1 & 0 & 0 & ... \\
0 & x_2 & 0 & ... \\
0 & 0 & x_3 & ... \\
\vdots & \vdots & \vdots & \ddots
\end{bmatrix}$



---
# Notes:

### Simplification of Operations:
- [[Matrix Product|Matrix Multiplication]] is generally very easy, since all we need to do is multiply values by the corresponding $x_i$ in the row / column.
- [[Matrix Inverse]] is simply $1/x_i$ for the diagonals.

- This still works for non-[[Square Matrix]]:
	- We add zeros to the end if our diagonal matrix is tall.
	- We discard elements if our diagonal matrix is wide.

---
# Examples:
- [[Identity Matrix]] where the diagonal values are 1.

----
# Source:
Source
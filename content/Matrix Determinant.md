---
aliases: 
tags:
  - math/linear_algebra
edited: 2025-02-15T16:15
created: 2024-03-23T12:36
---
### Definition:

**Geometric Interpretation, 3B1B**
Recall that a matrix $A, dim(A)=\mathbb{R}^{m \times n}$ represents a [[Linear Transformation]] of vectors from $\mathbb{R}^m$ to $\mathbb{R}^n$. 
Now consider the area/volume of a "unit square" with length 1 per each [[Basis]] vector. The determinant measures how much the matrix transformation stretches or squishes the area/volume.

---
### Notes:
For a 2x2 matrix:
$$\begin{array}{cc}
a &b \\
c &d
\end{array}$$
We have the determinant as $ad-bc$.

For a 3x3 matrix:
$$\begin{array}{cc}
a &b &c\\
d &e &f\\
g&h&i
\end{array}$$
We have the determinant as $a * det(ei-fh) - b * det(di - fg) + c * det(dh-eg)$

---
### Examples:
Examples
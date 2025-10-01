---
aliases:
tags:
  - math/linear_algebra
edited: 2025-08-26T22:23
created: 2024-03-23T12:36
---
# Definition:
Converts a [[Matrix]] into a scalar value.

---
# Notes:

### Geometric Interpretation
3B1B.

Recall that a matrix $A, dim(A)=\mathbb{R}^{m \times n}$ represents a [[Linear Transformation]] of vectors from $\mathbb{R}^m$ to $\mathbb{R}^n$. 
Now consider the area/volume of a "unit square" with length 1 per each [[Basis]] vector. The determinant measures how much the matrix transformation stretches or squishes the area/volume.
- If determinant is one, we preserve the area/volume.
- If determinant is zero, then at least one dimension has been crushed. Equivalent to saying [[Matrix Null Space]] is not empty, that [[Matrix]] does not have full [[Matrix Rank]], that the matrix does not have a [[Matrix Inverse]], etc.

### Formulas
For a 2x2 matrix:


\begin{bmatrix}
a &b \\
c &d
\end{bmatrix}$


We have the determinant as $ad-bc$.

For a 3x3 matrix:


\begin{bmatrix}
a &b &c\\
d &e &f\\
g&h&i
\end{bmatrix}$


We have the determinant as $a * det(ei-fh) - b * det(di - fg) + c * det(dh-eg)$ using Sarrus' Rule.

---
# Examples:
Examples
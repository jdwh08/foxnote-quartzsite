---
aliases: 
tags:
  - math/linear_algebra
edited: 2025-02-15T16:15
created: 2024-03-23T12:26
---
### Definition:
A square matrix which has no or infinitely many solutions. This means that it does not have an inverse.

**Geometric Interpretation, 3B1B**
Recall that a square matrix $A, dim(A)=\mathbb{R}^{n \times n}$ represents a linear transformation of vectors from $\mathbb{R}^n$ to $\mathbb{R}^n$. 

Thus, this is a matrix which "squishes" vector space in such a way that the transformation can no longer be reversed (no [[Matrix Inverse]]), since each point after the transformation corresponds to multiple different points before the transformation.

This means that the only solutions here are cases where the vector happens to land on the resulting "squished" lower-dimensional space.

---
### Notes:
Equivalent to saying the [[Matrix Determinant]] is zero, non-invertible, does not have full [[Matrix Rank]], has [[Linear Dependence]] in rows/columns, etc.

---
### Examples:
Examples
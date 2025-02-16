---
aliases: 
tags:
  - "#math/linear_algebra"
edited: 2025-02-15T16:36
created: 2024-03-29T20:39
---
### Definition:
Given a square matrix $A$, consider **$A\vec{x} = \lambda \vec{x}$.**  $\vec{x}$ are the **EIGENVECTORS** which maintain their same direction, only they are also $\lambda$ are the **EIGENVALUES** which multiply $\vec{x}$.

#### **Geometric Interpretation, 3B1B**
Recall that a square matrix $A, dim(A)=\mathbb{R}^{n \times n}$ represents a linear transformation of vectors from $\mathbb{R}^n$ to $\mathbb{R}^n$. 

**EIGENVECTORS** are the vectors $\vec{x}$ which maintain their direction after the linear transformation, and **EIGENVALUES** represent how much the transformation scaled the vector.

---
### Notes:
##### **Strang Fun Facts**
Square matrixes multiply vectors, and we are interested in vectors that keep their same direction.

Obviously, $\vec{x} \neq \vec{0}$ because this is always true for the zero vector. Finally, $\lambda \in \mathbb{R}$.
- When $\lambda = 0$, we are finding $A\vec{x}=\vec{0}$, which is equivalent to the [[Matrix Null Space]]. Thus, if $A$ is a [[Singular Matrix]]

A [[Projection Matrix]] in 3-d have eigenvectors which are in the plane, and the one vector which is perfectly perpendicular.

The sum of the $\lambda$ values equals the [[Matrix Trace]] (the sum of the diagonal from top-left to bottom-right). 
The determinant is also the product of the eigenvalues.

Transformations: 
- Adding $3I$ to a matrix changes its eigenvalues by $+3$, but does not change its eigenvectors: $(A+3I)x = \lambda + 3x$
- However, you can't generalize this: $(A+B)x = (\lambda + \alpha) x$ doesn't work because we can't be sure the eigenvectors for $A, B$ are the same.

You can have imaginary eigenvalues if the matrix gets close to being not symmetric (see example)
You can have cases where eigenvalues and thus eigenvectors are repeated (see example).

---
### Examples:
**Normal Example**
Suppose we have some square matrix 
$$A = \begin{bmatrix} 0 & 1 \\
-2 & -3
\end{bmatrix}$$
which we would like to calculate the eigenvectors and values of.

We need to find $A \vec{x}=\lambda \vec{x} = \lambda I^{n\times n} \vec{x}$. Subtract, so $A\vec{x}-\lambda I \vec{x} = \vec{0}$, which is nice and easy to work with now. This gives us $(A-\lambda I) \vec{x} = \vec{0}$, and $\vec{x}\neq \vec{0}$, so by the Zero Product Property we know that $A-\lambda I$ has some value that equals zero.
- In other words, $A-\lambda I$ has something in the [[Matrix Null Space]] besides $\vec{0}$
- In other words, $A-\lambda I$ is a [[Singular Matrix]] and non-invertible, hence $det=0$.

We can thus calculate $A-\lambda I:$
$$A - \lambda I= \begin{bmatrix} 0 & 1 \\
-2 & -3
\end{bmatrix} - 
\begin{bmatrix} \lambda & 0 \\
0 & \lambda
\end{bmatrix} = 
\begin{bmatrix} -\lambda & 1 \\
-2 & -3-\lambda
\end{bmatrix}$$
and this has [[Matrix Determinant]] of zero, so
$-\lambda(-3-\lambda) - -2*1 = 0 \rightarrow \lambda^2 + 3\lambda + 2 = 0$. which is our "characteristic equation"
- Notice how the Trace shows up as the middle term ($Tr(A)=-3$ vs $3\lambda$)
- Notice how the [[Matrix Determinant]] shows up as the last term ($det(A)=2$ vs $+2$)
$\rightarrow \lambda =-1,-2$
These are our **eigenvalues**.

Consider $\lambda=-1$ as our eigenvalue. Go back to $A\vec{x}=\lambda \vec{x}$, and solve [[Ax=0]] so $$\begin{bmatrix} 0 & 1 \\
-2 & -3
\end{bmatrix} 
\begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = -1 \begin{bmatrix} x_1 \\ x_2 \end{bmatrix}$$This gives the equations $x_2 = -x_1$ and $-2x_1 - 3x_2 = -x_2$. Both of these equations end up with $x_1=-x_2$, hence the associated **eigenvector**(s) is $x_1 * \begin{bmatrix} 1 \\ -1 \end{bmatrix}$ for any $x_1 \in \mathbb{R}$.


**Imaginary Eigenvalues**
Suppose we have some 90 degree rotation matrix. NOTE: there are no vectors other than $\vec{0}$ which preserve their direction, so there should be no eigenvectors. $$Q = \begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix}$$The [[Matrix Trace]] is $0+0=0=\lambda_1 + \lambda_2$, and the [[Matrix Determinant]] is $0*0-(-1*1)=1=\lambda_1\lambda_2$. We see that this polynomial shouldn't be possible...
- $det(Q-\lambda I) = \lambda^2 + 1 = 0$, so eigenvalues are $i, -i$. Uh oh, [[Complex Numbers]] since this is a complex conjugate pair.
- Notice how this matrix is the complete opposite of a [[Symmetric Matrix]], i.e., $Q^T=-Q$ not $Q$. The closer we get to symmetric matrix, the larger the real part of the eigenvalue.


**Repeated Eigenvalues**
Consider the eigenvectors/values of $$R = \begin{bmatrix} 3 & 1 \\ 0 & 3 \end{bmatrix}$$which is a [[Triangular Matrix]]. In these cases we can "read the eigenvalues" right off the diagonal, since the values which add to 6 and multiply to 9 are literally right there man.
Thus, we have a repeated eigenvalue: $\lambda = 3,3$.

What happens to the eigenvectors? Consider $(R-\lambda I)\vec{x} = \vec{0}$. We see that $$R-\lambda I = 
\begin{bmatrix} 0 & 1 \\ 0 & 0\end{bmatrix} \rightarrow 
\begin{bmatrix} 0 & 1 \\ 0 & 0\end{bmatrix} \begin{bmatrix} x_1 \\ x_2 \end{bmatrix} = \begin{bmatrix} 0 \\ 0\end{bmatrix}$$so, we get our eigenvectors are... both $x_1 \begin{bmatrix} 1 \\ 0 \end{bmatrix}$ so there isn't a second one.
Hence, this is a "degenerative matrix" where the eigenvalues don't get all the information.
---
aliases:
  - SVD
tags:
  - math/linear_algebra
edited: 2025-09-21T21:35
created: 2024-03-26T21:43
---
### Definition:
A type of [[Matrix Decomposition]] which breaks matrices down into $U \Sigma V^T$
- $U, V^T$ are [[Orthogonal Matrices]]
- $\Sigma$ is a [[Diagonal Matrix]] of values.

A more general form of the [[Eigenvalue Decomposition]] for non-square matrices.

---
# Notes:

### Formal Definition
Starting with a $n*m$ matrix $X$:


..\begin{bmatrix}
| & | & ... & |\\
x_1 & x_2 & ... & x_m\\
| & | & ... & |
\end{bmatrix}$


We'd like to decompose this into the following form:


..X=U\ \Sigma \ V^T$


Where $U, V^T$ are [[Orthogonal Matrices]], and $\Sigma$ is a [[Diagonal Matrix]].


..U = \begin{bmatrix}
| & | & ... & |\\
u_1 & u_2 & ... & u_n\\
| & | & ... & |
\end{bmatrix}$




..\Sigma = \begin{bmatrix}
\sigma_1 & & & \\
 & \sigma_2 & & \\
 & & ... & \\
 & & & \sigma_m \\
 0 & 0 & ... & 0 \\
 | & | & ... & |
\end{bmatrix}$




..V^T = \begin{bmatrix}
- & - & v_1^T & - \\
- & - & v_2^T & - \\
- & - & ... & - \\
- & - & v_m^T & - 
\end{bmatrix}$



$U$ is the Left Singular Vectors, $V$ is the Right Singular Vectors, and $\sigma$'s are the Singular Values.

##### Properties of the Formal Definition
Columns of U have the same length as the Columns of X."[[Eigenvectors and Eigenvalues|Eigenvectors]]" which are hierarchically arranged in order of importance of explaining the variance. Can be used to create a [[Basis]] for the data matrix $X$ / $\mathbb{R}^n$ space.
- NOTE: Since our initial data matrix $X$ only has dimensions $m,n$, there can't be more than $min(m,n)$ [[Linear Dependence|Linearly Independent]] columns; thus, only the first $n$ rows matter.

$U, V$ are [[Orthogonal Matrices]], i.e., $U^T U = U U^T = \mathbb{I}$.
$\Sigma$ is diagonal and hierarchically ordered, so $\sigma_1 \geq \sigma_2 \geq ...$ 


### Dimension Reduction
##### The Economy SVD
How do we reduce matrices using SVD when $n >>> m$ or $m >>> n$, e.g., big difference between numbers in features/columns vs samples/measurements?
- Since $\Sigma$ is diagonal, notice how $\sigma_k$ only affects $u_k$ and no other column vectors? Thus, the first column is relatively more important in describing the information. 
- Also notice how $u_k \sigma_k$ only gets multiplied by the $v_k^T$ row? I.e., the matrix multiplication becomes $\sigma_1 u_1 v_1^t + ... + \sigma_m u_m v_m^t + 0 + ... + 0$
	- **NOTE:** These are [[Matrix Outer Products]], i.e., column x row instead of traditional [[Matrix Product]] of row x column. This results in a fuckload of linearly dependent columns, all of [[Matrix Rank]] 1.
	- We can therefore rewrite SVD into a sum of rank one matrices!
- Finally, remember how because of the linearly independent columns, there are extra rows in $\Sigma$ which don't matter (and are thus 0)?
- We can simplify the $U \Sigma V^T$ into $\hat{U} \hat{\Sigma} V^T$ by chopping off all those 0s without losing any information!

##### Eckhart-Young Theorem
- We can also truncate the information to [[Matrix Rank]] $R$ (i.e., $\sigma_1 u_1 v_1^t + ... + \sigma_r u_r v_r^t$) and throw away the additional information which is very marginal. 
	- Note: This is starting to throw away information as opposed to Economy SVD which only threw away zeros.
- Procedure gives the best matrix approximation with rank $r$: $\hat{X}_r = \tilde{U}\tilde{\Sigma}\tilde{V^T}$
- Formally, this minimizes the [[Frobenius Norm]]: $\underset{\tilde{X}\ s.t.\ rank(\tilde{X})=r}{\arg\min} ||X - \tilde{X}|||_{Frobenius}$
- Notice that if we throw away information that $U,V$ are no longer square and thus are not [[Orthogonal Matrices]] anymore. 
	- $\tilde{U}^T\tilde{U} = \mathbb{I}_{r\times r}$, since we do the standard matrix multiplication dot product and everything is still orthogonal and good.
	- However, $\tilde{U}\tilde{U}^T$ is no longer an identity matrix because it's a big square thing.

### [[Correlation (Pearson)|Correlation]] Interpretation
Consider $X^T X$. Because we assume that $X$ is a matrix where each column represents an element and each row represents a feature, we assume that features >>> observations, or $n >>> m$, i.e., it is tall and skinny. Thus, $X^T X$ is $m*n \times n*m \rightarrow m\times m$ matrix, which is smaller. 
The first column is multiplied out as 

..\begin{bmatrix} 
x_1^T x_1 \\
x_2^T x_1 \\
... \\
x_m^T x_1
\end{bmatrix}$


And this repeats for all columns until you reach $x_m^T x_m$, where each one of these is basically the inner product of the vectors $x_i^T x_j = <x_i, x_j>$. This can be thought of as **[[Correlation Matrix]]**.
- Remember that each one of the columns represents an observation? (e.g., a face?) Thus, taking the [[Dot Product]] between the two matrices calculates their cosine similarity. **Larger values for inner products thus represent more similar**.
	- The inner products also means it's a [[Positive Semidefinite Matrix]], so it has non-negative and real [[Eigenvectors and Eigenvalues|Eigenvalues]].
- We can calculate this correlation matrix: $X^T X = V \hat{\Sigma} \hat{U}^T \ \hat{U} \hat{\Sigma} V^T$.
	- Remember how $\hat{U}^T \ \hat{U} = \mathbb{I}$ because [[Orthogonal Matrices]]. Thus, $= V \ \hat{\Sigma}^2 \ V^T$, which is an [[Eigenvalue Decomposition]] of the correlation matrix!
	- Multiply both sides, $X^T X V= V \hat{\Sigma}^2 V^T V = V \hat{\Sigma}^2$. In this case, $\hat{\Sigma}^2$ are the [[Eigenvectors and Eigenvalues|Eigenvalues]], and $V$ are the [[Eigenvectors and Eigenvalues|Eigenvectors]]. $(A \vec{v} = \lambda \vec{v})$.
- What does this mean? Right Singular Vectors $V$ are just the Eigenvectors of the column-based correlation matrix, while $\Sigma$ are the square roots of the column-based Eigenvalues.
	- Same argument applies for $X X^T$, but the math flips around to it being the row-based $X X^T \hat{U} = \hat{U} \hat{\Sigma}^2$. (Remember how # rows are much bigger than # columns? So this is huge.)
- The correlations are ordered and quantified because of the $\Sigma$s.
- In practice, we don't calculate SVD this way because it is slow and inaccurate, we use the [[QR Decomposition]]. However, this is good intuition.

---
### Properties:
1. Easily interpretable.
	1. Notice how each one of the columns of $U$ can be converted back into the original data. These form the "eigen-things", e.g., for a matrix of face images, each $U$ column can be interpreted as an "eigen-face".
	2. $\sigma \in \Sigma$ tell us the importance of each one of the dimensions/eigen-things in $U$ for the problem. **Notice how we can approximate the matrix $X$ by using only the most important dimensions!**
	3. Each column in $V^T$ tells us the "mixture weight" for each one of the representative eigen-basis column vectors in $U$ to go back to the original data $X$. I.e., $X_1 = U_1 * V_{1,1} + U_2 * V_{2,1} ...$
2. Fast to calculate.
3. Guaranteed to exist in all cases.
4. Basically unique. (Though you can construct two with different signs.)

---
# Notes:
"Data-driven generalization of the [[Fourier Transform]]": FFT approximates functions with sine/cosine, which is super useful to map a system into an easier coordinate. However, this basis doesn't work in all cases. SVD allows us to *tailor* a [[Coordinate System]] for the specific process.

### Usage
- Simple and interpretable [[Linear Algebra]].

What can SVD do?
- Solve $Ax=b$ problems for non-square A matrices (e.g., linear regression)
- Get the basis for [[Singular Value Decomposition]] 
- Identify the key correlations in your data

Models
- Google's [[PageRank]] algorithm
- Netflix/Facebook [[Recommender System]].

---
# Examples:

### Worked Example


--------
# Sources:
Brunton Lectures @ UWash
1. [Overview](https://www.youtube.com/watch?v=gXbThCXjZFM&list=PLMrJAkhIeNNSVjnsviglFoY2nXildDCcv&index=1&pp=iAQB)
2. [Maths](https://www.youtube.com/watch?v=nbBvuuNVfco&list=PLMrJAkhIeNNSVjnsviglFoY2nXildDCcv&index=2&pp=iAQB)
3. [As Matrix Approximation](https://www.youtube.com/watch?v=xy3QyyhiuY4&list=PLMrJAkhIeNNSVjnsviglFoY2nXildDCcv&index=3&pp=iAQB)
4. [Correlation Interpretation](https://www.youtube.com/watch?v=WmDnaoY2Ivs&list=PLMrJAkhIeNNSVjnsviglFoY2nXildDCcv&index=4&pp=iAQB)

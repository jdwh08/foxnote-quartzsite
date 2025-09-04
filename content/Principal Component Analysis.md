---
aliases:
  - PCA
tags:
  - math/linear_algebra
  - ds/ml/featureeng
  - ds/dimension_reduction
edited: 2025-08-26T21:40
created: 2024-03-26T21:39
---
### Definition:

Perform [[Feature Selection]] by creating new "components" which do a good job explaining [[Variance]] as a [[Linear Combination]]. Also reduces noise if they are low-importance [[Orthogonal Vectors]]. 

---

# Notes

PCA is the "bedrock dimensionality reduction technique" for dimensionality reduction / [[Feature Selection]].

Uses the [[Singular Value Decomposition]] to do [[Feature Selection]] linearly. Because it uses SVD, it creates a whole new [[Basis]] coordinate system for the data, where the axes capture the most variation.

### Algorithm

1. Identify the [[Eigenvectors and Eigenvalues]] from the matrix; pick the one(s) with the highest [[Variance]] along it so they capture as much linear information as possible.
	1. This means the dimensions are [[Orthogonal Vectors]].
2. Throw away the eigenvectors which have the smallest eigenvalues, i.e., provide the least linear information.

### Properties
1. This is "**global**" in the sense that all components are orthogonal
2. Creates the best reconstruction, i.e., convert from the new [[Basis]] principal components back to the original features, it has the lowest [[L2 Norm]] for the error.
3. Tells you which components are less important based on eigenvectors
4. Well studied and optimized

### Math:
Suppose we have some matrix $X$ where each *row* is an observation (differs from SVD literature). 
$$X = \begin{bmatrix}
- & - & x_1 & - & - \\
- & - & ... & - & - \\
- & - & x_n & - & - \\
\end{bmatrix}$$
We assume that $X$ is drawn from some underlying statistical distribution (typically [[Normal Distribution]] with zero mean). **This is how PCA and SVD differ.**
- Finds a line through the origin that best fits the data (like [[Linear Regression|OLS]]). This is analogous to finding the line that maximizes distance from the [[Vector Projection]] onto the line.
	- To keep the most information possible, we want to be sure to use a vector $u$ whose variance is large so it captures more variation in the higher-dimensional space.
	- $Proj_{u_1}(x_i) = u_1^T x_i u$, where $u_1^T x_i$ is the [[Dot Product]] written out as [[Matrix Product]], and $u$ is the vector that controls the direction.

![[PCA.excalidraw.png.svg|600x100%]]

Anyway... here's the procedure:
- Calculate the mean row: $\bar{x} = \frac{1}{n} \sum \limits_{i=1}^n x_i$
- Build out an "Average Matrix": 
$$\bar{X} = \begin{bmatrix}
- & - & \bar{x} & - & - \\
- & - & ... & - & - \\
- & - & \bar{x} & - & - \\
\end{bmatrix}$$
- Calculate $B = X - \bar{X}$. ("Mean center the data"). This does not change relative positions for each observation.
	- The analogue for this is the "[[Expected Value|Mean]] of the projections".
	- If we **don't do this**, then we probably will end up with the biggest component(s) that just talk about how to go to the origin.
- Calculate the [[Covariance Matrix]] $C=B^T B$.
	- The analogue for this is the "[[Variance]] of the projections"
	- $1/n \sum\limits_{n=1}^N (u_1^T x_i u - u_1^T \bar{x} u)^2 = 1/n \sum\limits_{n=1}^N (u_1^T(x_n - \bar{x}))^2$
	- Because $x_n - \bar{x}$ is a number, $= u^T (1/n \sum\limits_{n=1}^N (x_n - \bar{x})(x_n - \bar{x})^T ) u$. Note how the bit with the sum is a [[Covariance Matrix]] $C$.
	- We can think of this PCA problem as maximizing the variance, while ensuring the resulting vectors are unit vectors (basis vectors actually): $\max u^T S u \text{  s.t.  } u^T u = 1$. 
	- Using [[Lagrange Multipliers]]: $\frac{\partial}{\partial u} u^T C u + \lambda (1-u^T u) = 0 \rightarrow 2 Cu - \lambda 2 u = 0 \rightarrow$
	- $C u = \lambda u$. Oh look, an [[Eigenvectors and Eigenvalues]] thingy.
	- Hence, $u^T C u = \lambda u^T u = \lambda \rightarrow v_1 B^T B v_1$.
	- (This implies that our best eigenvector to use is the one with the biggest eigenvalue.)
- Compute [[Eigenvectors and Eigenvalues]] of $C$. You get $v_1^T B^T B v_1$ as your [[Eigenvalue Decomposition]], where $B^T B$ is our $C$ covariance matrix.
- Calculate principal components $T$ as $T=BV$, where $V$ is your "loadings", i.e., how much of your principal components each observation has.
	- SVD analogue: if $B=U\Sigma V^T$, then  $T=U\Sigma$.
	- The principal components are ordered in terms of variance explained by the first $n$ eigenthings.
	- To calculate the variance captured, we can use our lambdas $\lambda = \sigma^2 = Var(T)$, i.e., the [[Variance]] of that principal component in the data. Calculate the first $k$ lambdas divided by the total $\sum \lambda$ to get the fraction of explained variance.

### Practical Tips
1. Be sure that all your variables are using the similar scales! (e.g., divide by [[Standard Deviation]])
2. PCA needs you to center the data. Be sure you have done this in your program.
3. You can't have more PCs then the dimension of your data (since it's getting basis vectors)

### Alternatives
- [[Independent Components Analysis]] looks for sources of the [[Data Generating Process]] which are  [[Independent Events|independent]] instead of maximizing [[Covariance]] and ability to reconstruct data.
- [[Random Component Analysis]] is cheap and fast and maybe acceptable.
- [[t-SNE]] is a nonlinear method designed to represent local behaviour instead of global.
- [[Uniform Manifold Approximation and Projection|UMAP]] is another alternative dimensionality reduction technique which is non-linear.

#### Comparison to [[Independent Components Analysis]]:
1. Features are  [[Orthogonal Vectors]] instead of being [[Independent Events|independent]].
2. Features maximize [[Variance]] along the components instead of [[Mutual Information]].
	1. If the data is [[Normal Distribution]], then these two are the same.
3. Features have ordering based on eigenvalues
4. Use Case:
	1. **If you think the features are normally distributed**.
5. **Not** sensitive to the [[Matrix Transpose]].

---
# Example:

![[Independent Components Analysis#Face Identification]]
PCA, by comparison, will find **brightness**, then the "average face". This is **LOCAL**.

---
# Source:

Statquest! :D
GaTech ML

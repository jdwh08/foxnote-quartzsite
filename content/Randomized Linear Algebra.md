---
aliases:
tags:
  - math/linear_algebra
  - cs
edited: 2025-09-30T21:59
created: 2024-04-08T19:33
---
### Definition:
A set of algorithms for [[Numerical Linear Algebra]] which dramatically speed up their processes by allowing for randomization.

**Basic Idea**
With some high [[Probability]], taking a random summary of the data shrinks the problem while preserving almost all the information.
- Instead of ensuring MOST EXACT ANSWER FIRST, then optimize (a la classical NLA), 
- We calculate a CLOSE ENOUGH answer with HIGH PROBABILITY, in exchange for super fast data.

---
### Notes:
**Why is this okay?**
- For #ds/ml, we assume the data is noisy to begin with (and repeated samples might give different data), so the extra noise from Randomized NLA is more reasonable.
- Close enough can sometimes be EXTREMELY close, and high probability might be EXTREMELY high.

---
### Examples:
Suppose we want to have a **[[Least Squares]]**. Given some matrix $A$ which is $m\times n, n <\!< m$, and a target vector $\vec{b}$ which is dimension $m$, we want to find $x$ to minimize this.
$$\underset{x}{\arg \min} \ ||Ax-b||_2$$
We want to find $x$ in a relatively fast way. [[Numerical Linear Algebra]] conventional methods solve this in $O(mn^2)$. (Having the square be on $n$ is better because it's smaller.) 

Now suppose we can accept some small error $\epsilon$. Instead of solving this in $O(mn^2)$, we can solve this in $O(mn\log(1/\epsilon)+n^3)$ time.
- If we want a strong approximation (e.g., 3 sigfigs+), then $\log(1/\epsilon)$ is in the single digits.
- Because $m >\!> n$, as $m\rightarrow \infty$, we can see that $\lim \approx \frac{mn^2}{mn\log(1/\epsilon)}=\frac{n}{\log(1/\epsilon)}$.  If $n \approx 1000$ then the speedup is approaching $1000\times$ the classical [[Numerical Linear Algebra]] solution.
- In practice, we get around $20\times$.

*How do we get to this? Sketch-And-Solve method (there are others)*
1. Sample a random matrix $S$. Solve the least squares method, but we do some sampling so $A\rightarrow SA, b \rightarrow Sb$.
2. We design $SA$ to have many fewer rows than $A$. (This might be analogous to stripping off the extra rows in an "Economy" [[Singular Value Decomposition]].) This creates a "sketch" of the problem.
3. The sketch and solve problem has the following property with high probability:
$$x^*=\arg\min||Ax-b||_2,\ \tilde{x}=\arg\min||SAx-Sb||_2$$
$$||A\tilde{x}-b||_2\approx |||Ax^*-b||_2$$
	and we can control the probabilities.  

*Why does this work? Some intuition.*
To solve the [[Least Squares]] problem, we at some point need to determine the [[Covariance Matrix]] of $A$.
Now suppose we consider $SA$, where we use $S$ to sample using properly scaled random [[Normal Distribution]]s, with $d$ rows, and the same number of columns as $A$ has rows.

![[Random_LinAlg_Cov.png|100%x]]

- This is still true if we attach $b$ or $Sb$ on the right side of the matrix (like $[A|b]$) to make an [[Augmented Matrix]]. Thus, everything that drives the simulated solution still works.
- Uh technically this isn't quite right, and we're actually approximating "relative differences" as opposed to absolute differences? 
	- Suppose we have our covariance matrix $C_1$ we want to approximate with $C_2$.
	- We can decompose $C_2 = R^T R$, and getting $C_{1pre} = R^{-1 T} C_1 R^{-1}$, then visualizing the ellipse for $C_{1pre}$. If the approximation is perfect, this should be a circle, otherwise, we want to minimize the ratio between the longer and shorter axes of the ellipse.
	- These methods work much better in higher dimensions, where one of the axes of the relative ellipse might be SUPER HUGE relative to the smallest.
- Anyway the point is that we can now expand the number of problems that can be solved super quickly beyond just optimized matrix multiplication.

---

A published paper showed that [[Singular Value Decomposition]] decomposition can be sped up almost 120x in pure R. This is because NLA is mostly sparse.

[[CholeskyQR]] with Randomization & Pivoting for Tall Matrices (CQRRPT) is incredibly impressive for Cholesky QRs. 
- Given some very tall matrix $A$, we want to decompose it into $A=QRP$, such that $Q$ is an [[Orthogonal Matrices]], $R$ is an [[Upper Triangular Matrix]], and $P$ is a [[Permutation Matrix]].
- Permutation matrix $P$ orders the results in such a way that it "preserves numerical stability" and "provides more information about the decomposed matrix". This is formally a [[QR Decomposition]], but we also do some column pivoting. Helpful for solving [[Least Squares]] problems.
- 10-20x speedups, with bottlenecking because less data is available. Alternatives do not do the column pivoting, or are only available for matrices with full [[Matrix Rank]].
- The authors note that this randomization is almost good enough

---
### References: 
Mutual Information on [Random Linear Algebra](https://www.youtube.com/watch?v=6htbyY3rH1w). 
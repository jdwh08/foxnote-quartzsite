---
aliases: 
tags:
  - cs
  - math/linear_algebra
edited: 2025-02-15T16:23
created: 2024-04-08T19:13
---
### Definition:
Study of applying [[Linear Algebra]] **fast and efficiently** on computers.

Challenges:
1. Computers have finite precision.
	1. A random point must have its value truncated slightly.
	2. Thus, addition is not associative in a computer. $(a+b)+c \neq a(b+c)$. I.e., "Numerically Unstable".
2. Fast algos are machine-dependent.
	1. For example, matrix multiplication $AB=C$ is defined as having each row in $A$ multiplied by each row in $B$. 
	2. Instead of calculating each value one at a time in order ($C_{1,1} \rightarrow C_{1,2} ...$), we could instead calculate it to use each column of $A$ first, i.e., $(C_{1,1} \rightarrow C_{1,2} \rightarrow ...)$. 
	3. The ordering affects the speed of the computer because it requires different data at different times. This depends on the dimensions of $A,B$, what is stored in cache/registry, etc.
	4. Memory layout, OS, processor, parallelism also affect speed. 
	5. Designing good NLA algorithms thus require us to know this information.

---
### Notes:
Notes

---
### Examples:
Consider the basic building block: Matrix Multiplication.


..AB=
\begin{bmatrix}
    a_{11} & a_{12} & \dots  & a_{1n} \\
    a_{21} & a_{22} & \dots  & a_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    a_{n1} & a_{n2} & \dots  & a_{nn}
\end{bmatrix}
\begin{bmatrix}
    b_{11} & b_{12} & \dots  & b_{1n} \\
    b_{21} & b_{22} & \dots  & b_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    b_{n1} & b_{n2} & \dots  & b_{nn}
\end{bmatrix}
$


This is a [[Big O]] of $O(n^3)$, because as we increase the size of the matrix from $n\times n$ to $(n+1) \times (n+1)$, the number of operations increases by $n^3$. We need some way to reduce this!
Volker Strassen's $AB$ method gives $O(n^{2.8704})$. We have since reduced it to around $O(n^{2.4})$, but it has plateaued.
- The goal for BLAS/LAPACK software systems (see below) is to break down matrix problems into using highly optimized general matrix multiplication functions over other methods.

Suppose we want to have a **[[Least Squares]]**. Given some matrix $A$ which is $m\times n, n <\!< m$, and a target vector $\vec{b}$ which is dimension $m$, we want to find $x$ to minimize this.


..\underset{x}{\arg \min} \ ||Ax-b||_2$


We want to find $x$ in a relatively fast way, so $O(mn^2)$. (Having the square be on $n$ is better because it's smaller.) See [[Randomized Linear Algebra]] for an even fast approach if we tolerate some error $\epsilon$.

**Other Approaches for Speed**
- Communication avoiding algorithms: minimize the amount of data that gets moved (which takes loads of time) by anticipating the hardware.
	- Must be super careful for hardware.
- Hardware acceleration: specialized hardware designed to do one type of task super quickly.
	- Cannot be applied to other hardware.

---
### History:
1947: van Neumann and HH Goldstein publish first linear algebra code.
1957: IBM creates Fortran for scientific computing.
1960s: JH Wilkinson publishes papers for how to use algorithms for positive definite matrices.
1979: NASA JPL invents BLAS: Basic Linear Algebra Subprograms for Fortran. This had some basic fast vector algos tested across multiple machines. **Linpack** expands this.
1984: BLASv2 uses vectorized CPUs for matrix ops.
1990: BLASv3 uses modern cache-based processing.
1992: LAPACK released by Jack Dongarra, James Demmel, et al. 
- ScalaPack/PBlas can work with distributed computing.
- BLAST and some other methods have tried to optimize computing for sparse matrices.
- MAGMA optimizes BLAS for Nvidia GPU hardware. cuBLAS optimizes this for Nvidia, and Accelerate optimizes this for Apple Silicon.
- ATLAS and GPTune have automated tuning for different processors. GPTune uses [[Bayesian Optimization]] and [[Gaussian Processes]].
- BatchedBLAS does this for batches of similar info.

---
### References:
Mutual Information on [Randomization Methods](https://www.youtube.com/watch?v=6htbyY3rH1w).
---
aliases:
  - NFLT
tags:
  - ds/ml/theory
  - cs/dsa/optimizers
edited: 2025-09-03T19:29
created: 2024-03-19T22:06
---
# Definition:

It is impossible to find an [[Machine Learning]] algorithm or [[Optimizer]] which outperforms on **everything**.

Instead, we must get outperformance tailored to some specific **problem** that we are solving.

---
# Notes:

### Formal Defintion
> Any two [[Optimizer]]s are **equivalent in performance** when their performance is averaged across all possible problems.

> Averaged over all possible [[Data Generating Process]], every classifier has the same error rate when classifying new data.

#### Implications
1. We typically don't work with *all* possible data distributions.
2. We can make assumptions about the kinds of [[Data Generating Process]]es we are considering.
3. Making these assumptions helps find optimal solutions for that subset.

---
# Examples:

For [[Search]], the No Free Lunch Theorem implies that on average all search algorithms perform no better than random search. (unless we can make some prior assumptions on the data)

### Basic Proof
Suppose we are learning some possible $f$ for $y=f(x)$. In our case, we'll make these all discrete and have finite choices (two ys, many xs, many fs, etc.). Write them in a table. 

|     | f0  | f1  | f2  | ... |
| --- | --- | --- | --- | --- |
| x0  | y0  | y1  | y0  |     |
| x1  | y0  | y0  | y1  |     |
| x2  | y0  | y0  | y0  |     |
| ... |     |     |     |     |
We can interpret this as the $f$ columns being the potential *problems*, and the $x$ rows being the *potential model for prediction*. 

We need some sort of way to assign our $y$ values based on our $x$ models so that it covers all possibilities. One way to do that is by converting the column into some base (e.g. 2 options for y means base 2, so column 0 is 0 in base 2).

Note this is technically a special type of matrix called a "counting matrix", with the properties
1. $I$ rows and $O^{I}$ columns.
2. Each column is the base $O$ representation of the column (e.g., column 1 in binary is 001)
3. Each integer appears some $O^{j-1}$ times. 
4. Removing any row $i$ and columns $k$ gives another counting matrix.
5. Row sums are equal, so row averages are equal.

----
# Source:
Originally by (Wolpert 1996)
Goodfellow Deep Learning 
[Simple Explanation of the No Free Lunch Theorem of Optimization](https://doi.org/10.1109/CDC.2001.980896) (Ho and Pepyne, 2001)
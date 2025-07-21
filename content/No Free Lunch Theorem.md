---
aliases: 
tags:
  - ds/ml/theory
  - cs/dsa/optimizers
edited: 2025-06-14T11:10
created: 2024-03-19T22:06
---
# Definition:

It is impossible to find an ML algorithm or optimizer which outperforms on **everything**.
Instead, we must get outperformance based on the **problem** that we are solving.

---
# Notes:
> Any two [[Optimizer]]s are **equivalent in performance** when their performance is averaged across all possible problems.

We really need to make an assumption about the [[Data Generating Process]] and have models that best fit the DGP in order to get better performing hypothesis models.

---
# Examples:

For [[Search]], the No Free Lunch Theorem implies that on average all search algorithms perform no better than random search. (unless we can make some prior assumptions on the data)

----
# Source:
Simple Explanation of the No Free Lunch Theorem of Optimization (Ho and Pepyne, 2001)

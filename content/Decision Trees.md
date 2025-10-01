---
aliases: 
tags:
  - ds/ml/trees
edited: 2025-09-23T16:16
created: 2024-09-17T20:53
---
### Definition:
Using the features $X$, comes up with a series of `if-then` rules which best segment the target variable $y$. Store these as a [[Tree]] structure.

[[Nonparametric Statistics|Nonparametric]] [[Supervised Machine Learning]] technique for both [[Regression]] and [[Classification]] tasks.

Decision trees partition the feature space into continuous "regions" which are used for the output.

---
### Notes:

#### Pros and Cons
##### Pros
- Easy to understand, interpret, and explain
- Inference costs are $O(log n)$, which is faster than [[K-Nearest Neighbours]] but not [[Linear Regression|OLS]]
- Data does not need to be normalized.
##### Cons
- Trees kinda suck at prediction.
- Training cost is high compared to [[K-Nearest Neighbours]] and [[Linear Regression|OLS]]
- Tends to build gangly trees that overfit
- Trees are not robust, unstable to slight variations in dataset
- Piecewise approximation of real DGP means discontinuities
- Actual best decision tree is [[NP-Complete]], we must approximate with [[Greedy Algorithm]] or other heuristics which might not give global optimum tree.
- Difficult to learn some problems like XOR.
- Does not handle imbalanced data well. 
- Does not handle extrapolation well.

---
#### How Decision Trees Work
Decision trees work because they do a good job expressing the space:

![[_Media/Excalidraw/Tree_XOR.svg]]

This can generalize to many different functions, e.g., n-OR (ANY), or n-AND (ALL), or n-XOR (Parity), etc.
- (you can imagine that the tree for n-ANY is a long snake A->B->C->D... where if any variable is True, we return true, and at the end of the snake we return false)
- The space required to learn each operation is different!
	- Operations like OR require us to only look at one tree branch. Linear, O(N) relatively easier.
	- Others like XOR require both branches. O(log(N)), relatively hard.

##### The expressiveness means *the search space is huge*!
- Suppose we have $n$ features, $1$ target variable, and all features/targets are boolean.
- Consider the following truth table:

| $x_1$ | $x_2$ | $x_3$ | ... | $x_n$ | $Y$ |
| ----- | ----- | ----- | --- | ----- | --- |
| T     | T     | T     |     | T     | T   |
| T     | T     | T     |     | T     | F   |
| F     | T     | T     |     | T     | T   |
| ...   | ...   | ...   | ... | ...   | ... |
There are $2^N$ possible combinations of values for the x's.
By the same logic, there are $2^{2^N}$ values for the y's. That's too much to search through.
(the search space is the "Space for Classification and Regression Trees" CART)

Thus, our training algorithm needs to be very sparse or good at [[Decision Trees Pruning]].

----
#### Training Decision Trees
##### Handling Continuous Features
- We can't look at each potential value because $\mathbb{R}$ is our space.
- We can't only look at training set because this doesn't generalize.
- Thus, we convert continuous features into binary ones using a comparison.
	- We would decide these splits based on the values in the training set (e.g., split on median...)
- We could split on different values for continuous variables. (Age < 20, Age < 30, ...)

##### For Classification
- Look at [[ID3]] by JR Quinlan for this example algorithm.
- How do we split? The intuitive is [[Classification Error Rate]]: equal to the fraction of observations in the region $R_m$ which are not the same as the most common class. $E=1 - \underset{k}{\max}(\hat{p}_{mk})$. This **doesn't work!!!** it's not sensitive enough.
- We could also use the [[Gini Index]] (err, kinda the gini): $\sum_i \hat{p}_{mk}(1 - \hat{p}_{mk}) = 1-\sum_{c} (p_c)^2$ where $c$ is the classes.
- ID3 uses [[Information Gain]] on [[Entropy (information theory)]] to decide splits which are valuable or not.

##### For [[Regression]]
- [[Information Gain]] doesn't work as well because it's not a classification problem.
- Instead, we need a different [[Loss Function]] that works for continuous data, like [[Mean Squared Error]] or [[Residual Sum of Squares]].
- Our output is now the [[Expected Value]] of each [[Leaf Node]].

##### Stop Conditions
- If we have no noise ([[Statistical Learning|Irreducible Error]]) then we can stop at perfect sorting. But this doesn't generalize [[Overfitting]].
	- This happens when we build long gangly trees.
	- We can fix overfitting by [[Decision Trees Pruning|pruning]] leaves (e.g., delete the child nodes if [[Information Gain]] is too small), growing leaves breadthwise, etc.
- In the real world, we'd want to stop once our validation data set [[Loss Function]] does well.

----
#### Implementation
![[_Media/Excalidraw/Decision Trees-20250125112828343.webp]]
![[_Media/Excalidraw/Decision Trees-20250125112841281.webp]]
Okay, this is very Georgia Tech #ds/ml/ML4T only, but...
- We use a numpy array with recursion to represent the tree.
- Each node has its id on the left, its splitting feature, the split value, and the relative positions for data that goes into the left and right node.
- [[Leaf Node]]s have the factor "leaf" (e.g., -1), and the splitval represents the value that leaf predicts.

-----
### Examples:
Examples

---
## Source
ML4T

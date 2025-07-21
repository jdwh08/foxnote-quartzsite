---
aliases: 
tags:
  - ds/ml/featureeng
edited: 2025-06-11T21:46
created: 2024-03-19T22:06
---
# Definition:
Determine which feature(s) are needed for some problem.

---
# Notes:

### Formal Definition
Given some $n$ features, choose $m \le n$ features such that we maximize some arbitrary scoring function $f()$.

### Reasons to do Feature Selection
[[Unsupervised Machine Learning]]:
- Discover knowledge about data, e.g., [[Exploratory Data Analysis]]
- [[Interpretability]] for models
- Reduce the [[Curse of Dimensionality]]:
	- The amount of data needed grows exponentially $2^n$ with the number of features.

### Time Complexity
- $n \choose m$ if we happen to know $m$ ahead of time (we don't)
- $2^n$ if we have to check every single subset problem
- This is [[NP-Hard]] since we have to find arbitrary optima

### Options for Solving the Problem:
#### Filtering:
- We input some features, search through them, and get fewer features as an output.
- Pros: 
	- Fast, does not need to run the learner
- Examples:
	- [[Information Gain]] and [[Entropy (information theory)]] (like in [[Decision Trees]])
	- [[Variance]]
	- Features without [[Multicollinearity]]
#### Wrapping:
- We search over some subset of features, send them to the ML algorithm to get results, and search based on that.
- Pros:
	- Takes model and learning into account
- Examples:
	- [[Optimizer]] searching over features
	- [[Forward Selection]] and [[Backward Selection]]

### Feature Types
- [[Relevant Feature]]
- [[Useful Feature]]

---
# Examples:

### Relevant Features for AND function

| a   | b   | c   | d   | e   | Y   |
| --- | --- | --- | --- | --- | --- |
| 0   | 0   | 1   | 1   | 1   | -   |
| 0   | 1   | 1   | 0   | 1   | -   |
| 1   | 0   | 1   | 0   | 0   | -   |
| 1   | 1   | 1   | 0   | 0   | +   |

If we have [[Decision Trees]], then we can represent this with $A, B$.
- $B$ is strongly relevant because it provides needed information
- $A, E$ are weakly relevant because if we have neither, adding one will help improve performance. We don't need both because $A = \not E$
- $C$ is irrelevant because it does nothing.

If we have a [[Perceptron]]
- Adding $C$ is not relevant since it doesn't add information
- Adding $C$ is *useful* because it allows us to express $wx \ge -C$, instead of being stuck at the origin with $wx \ge 0$

----
# Source:
GaTech ML
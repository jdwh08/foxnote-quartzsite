---
aliases:
tags:
  - ds/ml
edited: 2025-09-28T22:54
created: 2024-03-19T22:06
---
# Definition:

As the number of features grows, the amount of data needed to correctly learn from it grows exponentially $\sim v^n$, where $v$ is possible feature values and $n$ is the number of features.

---
# Notes:

### Geometric Interpretation
As our dimension increases, the density of the points decreases exponentially.

Imagine the number of points needed for the same density coverage. 
We go from $\mathbb{R}^1 \rightarrow \mathbb{R}^2 \rightarrow ...$ hence exponential.

### [[Model Bias]]
To handle this in [[Machine Learning]], we need to make some assumptions. This causes us to choose some representations over others...

1. **Smoothness** / **Local Consistency**: Within some small region $\epsilon$, the target probably shouldn't change too much. E.g., $f(x) \approx f(x+\epsilon)$.
	1. This makes the learned representation tied to the example instances.
	2. [[K-Nearest Neighbours|KNN]]. Literally the whole definition
	3. [[Support Vector Machines|SVM]] with most kernels (they are usually local).
	4. [[Decision Trees]] within each decision region.

2. [[Data Generating Process]] consists of some hierarchical [[Composition]] of features
	1. [[Deep Learning]] assumes this with its layer design, e.g., [[Convolutional Neural Network|CNN]].

3. Data is some low dimensional [[Manifold]] [[Embeddings|embedded]] in higher dimensional feature space.
	1. This is [[Manifold Learning]]. 
	2. We basically "throw away" most space as not important.
	3. Goodfellow et al. in Deep Learning assume this is generally true:
		1. Probability distribution of inputs (words / pixels / audio etc.) is generally concentrated. Most examples are meaningless [[White Noise]].
		2. We can think of "transformign"

---
# Examples:
Examples

----
# Source:
Source
---
aliases:
  - KNN
tags:
  - ds/ml/knn
edited: 2025-02-16T19:42
created: 2024-03-19T22:06
---
# Definition:
[[Machine Learning]] system which predicts values by looking at the average of the closest $k$ values to the existing value.

Formally, given some value $K$ and prediction point $x_0$, we identify the $K$ observations closest to $x_0$ (hence $\mathcal{N}_0$), and then estimate $$f(x_0)=\frac{1}{K} \sum_{x_i \in \mathcal{N}_0} ^ K y_i$$

---
# Notes:

Key metric here is the value of $k$. As $k \rightarrow 1$, our model becomes more expressive but more likely to [[Overfitting|overfit]]. K controls our [[Bias-Variance Trade Off]].
- $K=1$ is perfect fit to the data.
- $K$ being large smooths out the data but introduces [[Bias (estimator)]] by smoothing over variation in the true [[Data Generating Process]].

This is different from [[Kernel Regression]] (another [[Nonparametric Statistics]] measure) because we **do not weight values based on how far away they are.**

#### KNN Issues
1. [[Curse of Dimensionality]]: If we have few observations but a high number of features, we might not have any close neighbours.
2. Interpretability

---
# Examples:
Examples

----
# Source:
Source
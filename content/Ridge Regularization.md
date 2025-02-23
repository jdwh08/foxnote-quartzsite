---
aliases: 
tags:
  - stats
  - ds/ml/regularization
edited: 2025-02-22T14:31
created: 2024-03-19T22:06
---
# Definition:
Add an [[L2 Norm]] penalty term as [[Regularization]] in order to dissuade complex models and [[Overfitting]].


---
# Notes:
Our squared penalty term increases the cost for parameters which are large.
![[Ridge_Regularization.excalidraw.png.svg]]

Unlike [[Lasso Regularization]], ridge tends to shrink parameters but not set them to zero.
This is because our [[Loss Function]] penalty is still smooth, so there is no kink where a parameter has value 0.

---
# Examples:
#### [[Ridge Regression]].
Suppose we have some model with parameters **w** and [[Loss Function]] e.g., the [[Mean Squared Error]]: 
$$L(\mathbf{w}) = 1/2 \sum_i^N (y_i - \hat{f}(x_i, \mathbf{w}))^2$$
We might want to add [[L2 Norm]] [[Regularization]] to avoid parameters from getting too large. Thus, we can add a regularization term which penalizes the **w**:
$$L(\mathbf{w}) = 1/2\ \sum_i^N (y_i - \hat{f}(x_i, \mathbf{w}))^2 + \frac{\lambda}{2} ||\mathbf{w}||_2^2$$
where $||\mathbf{w}||_2^2$ is the [[L2 Norm]] squared: $w'w = w_0^2 + w_1^2 + w_2^2 + ...$

By incorporating the [[L2 Norm]] directly into the cost function using [[Lagrange Multipliers]], we penalize $w$ values that are too large.'

 Note that typically our intercept is not regularized with the other values.

----
# Source:
Source
---
aliases:
  - Least Absolute Shrinkage and Selection Operator
tags:
  - stats
  - ds/ml/regularization
edited: 2025-02-17T16:12
created: 2024-03-19T22:06
---
# Definition:
Add an [[L1 Norm]] penalty term as [[Regularization]] in order to dissuade complex models and [[Overfitting]].

Has effect of making parameters sparse, i.e., $\beta=0$.

---
# Notes:
Our absolute value penalty term increases the cost for parameters which are large.
![[Lasso_Regularization.excalidraw.svg]]

Unlike [[Ridge Regularization]], lasso tends to set 
This is because our [[Loss Function]] penalty has large kink corners where our parameters are zero. This tends to make the optimal solutions corner solutions.

---
# Examples:
#### [[Lasso Regression]].
Suppose we have some model with parameters **w** and [[Loss Function]] e.g., the [[Mean Squared Error]]: 
$$L(\mathbf{w}) = 1/2 \sum_i^N (y_i - \hat{f}(x_i, \mathbf{w}))^2$$
We might want to add [[L1 Norm]] [[Regularization]] to avoid parameters from getting too large. Thus, we can add a regularization term which penalizes the **w**:
$$L(\mathbf{w}) = 1/2\ \sum_i^N (y_i - \hat{f}(x_i, \mathbf{w}))^2 + \frac{\lambda}{2} ||\mathbf{w}||_1^2$$
where $||\mathbf{w}||_1^2$ is the [[L1 Norm]]: $= abs(w_0) + abs(w_1) + abs(w_2) + ...$

By incorporating the [[L1 Norm]] directly into the cost function using [[Lagrange Multipliers]], we remove parameters which are not as useful for prediction.

----
# Source:
Source
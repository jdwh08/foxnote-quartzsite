---
aliases:
  - Correlation
tags:
  - stats
edited: 2025-02-15T15:45
created: 2024-03-23T12:54
---
### Definition:
The strength of the linear relationship between two [[Random Variable]]s. Their [[Covariance]] divided by the square root of their [[Variance]]:



r \text{ or }\rho_{x,y} = \frac{Cov(x,y)}{\sqrt{Var(x)Var(y)}}=\frac{\sum((x_i-\hat{x})(y_i-\hat{y}))}{\sqrt{\sum(x_i-\bar{x})^2 * \sum(y_i-\bar{y})^2}}$



Can be thought of as "normalizing" the covariance to the range $[-1, 1]$. This also means it isn't affected by the units of $x, y$.

---
### Notes:
This is NOT the same as the slope in [[Linear Regression|OLS]].

---
### Examples:
Examples
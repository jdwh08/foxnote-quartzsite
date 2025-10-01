---
aliases:
  - RSE
tags:
  - stats
  - ds/ml/linreg
  - ds/ml/loss_function
edited: 2025-02-16T18:24
created: 2024-03-19T22:06
---
# Definition:
The [[Standard Error]] of the [[Residuals]] in a [[Linear Regression]].



RSE=\sqrt{\frac{1}{n-p-1}RSS}=\sqrt{\frac{1}{n-p-1}(y_i-\hat{y}_i)^2}$



where $n$ is our observations and $p$ is our features.

Used as a sample proxy for the [[Statistical Learning|Irreducible Error]] $\sigma$ in estimating [[Linear Regression|OLS]] parameters.

---
# Notes:
An okay measure of "lack of fit" for a model to the data. Measured in units of the response $Y$.

If we add a feature that isn't very useful, $RSE$ can actually increase as $p$ increases!

---
# Examples:
Examples

----
# Source:
Source
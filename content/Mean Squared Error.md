---
aliases:
  - MSE
tags:
  - ds/ml/loss_function
  - stats
edited: 2025-09-04T08:58
created: 2024-03-19T22:06
---
# Definition:
[[Loss Function]] for a [[Regression]] problem on a dataset.



..MSE(\theta) = \frac{1}{N} \sum_{i=1}^{N}(y_i-\hat{f}(x_i\ ;\ \theta))^2$



---
# Notes:

### [[Statistical Learning]] [[Maximum Likelihood Estimation|MLE]] Perspective
- Suppose our model $\hat{f}$ creates a [[Probability Distribution]] $P(y|X)$, which we are trying to fit to the data.
- We can use the [[Normal Distribution]] as our family for the probability distribution, and assume the [[Data Generating Process]] is [[Independent and Identically Distributed|IID]]. $P(y|X) \sim N(y; \hat{f}(x, w), \sigma^2)$

Taking the [[Log Likelihood]] gives us 
- $\log \left( (2\pi\sigma)^{-n/2} e^{-\frac{1}{2} (\frac{\hat{f}-y}{\sigma})^2} \right)$
- $-\frac{n}{2} \log(2\pi\sigma) - \frac{1}{2} (\frac{\hat{f}-y}{\sigma})^2$
- We then would optimize by taking the [[Derivative]] with respect to $\hat{f}$.
- The final solution for both MLE and MSE are based on $(y-\hat{f})^2$.

---
# Examples:
Examples

----
# Source:
Source
---
aliases:
  - Coefficient of Determination
tags:
  - ds/ml/linreg
  - stats
  - ds/ml/loss_function
edited: 2025-02-16T17:57
created: 2024-03-19T22:06
---
# Definition:
The fraction of total [[Variance]] explained by the model. Ranges between 0 and 1.



..R^2=\frac{TSS-RSS}{TSS}$


where $RSS$ is the [[Residual Sum of Squares]], and $TSS$ is the [[Total Sum of Squares]] $\sum_i^n (y_i-\bar{y})^2$.

---
# Notes:
Because it's generally bounded between 0-1, it's more easy to interpret than the [[Residual Standard Error]] or other error metrics similar to it like the [[Mean Squared Error|MSE]] or [[Root Mean Squared Error|RMSE]].

#### Linear Regression Correlation Relationship
Has a special relationship for [[Linear Regression]].
- For simple [[Linear Regression]] with one feature: we can calculate our [[Correlation (Pearson)]] r between x and y, and square it. $r^2$ quite literally.
- For multiple [[Linear Regression]] (multiple features): we can calculate the [[Correlation (Pearson)|Correlation]] between the target $Y$ and the predicted values from linear regression $\hat{Y}$ of the features, and square it.
	- Suppose we have $c=(r_{x_1, y}, r_{x_2, y}, ...)$ and a correlation matrix between all the $x$ features $R_{x,x}$. Then, we can calculate $R^2=c' R_{x,x}^{-1} c$
- Thus, $r^2$ is equivalent to how strong the linear relationship is between our features $X$ and our target $y$. 

#### Negative $R^2$ Edge Case
- If our estimates are really horrible (e.g., random, or [[Linear Regression]] with zero-intercept), we might actually get negative $R^2$. 
- We would be better off predicting values with the sample mean then.


---
# Examples:
Examples

----
# Source:
Source
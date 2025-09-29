---
aliases:
  - Cov
tags:
  - stats/probability
edited: 2025-09-10T22:25
created: 2024-03-23T12:50
---
### Definition:
Measures the linear relationship between two [[Random Variable]]s, i.e., how much one RV linearly moves with a change in the other variable. 

A generalization of [[Variance]] to multiple varaibles.

$$cov_{x,y} = E[(X-E[X])(Y-E[Y])]=E[XY]-E[X]E[Y]=\frac{\sum\limits_{i} (x_i-\hat{x})(y_i-\hat{y})}{N-1}$$

For a normalized and scaled variation, see [[Correlation (Pearson)]].

---
### Notes:

**Unit Scale**
- Can go from $[-\infty, \infty]$, and is affected by (*and measured in!*) the units of the $x, y$ variables. 
	- E.g., changing $x$ from meters to kilometres will increase the covariance by 1000.

**Dependencies**
- We need to know the [[Joint Probability]] to calculate this (each $x_i, y_i$)!

**Interpretation**
- $cov(x,y) > 0$ means there is a positive linear relationship, i.e., more X more Y.
- $cov(x,y)< 0$ means there is a negative linear relationship, i.e., more X less Y.

**Independence Relationship**
- If the two random variables are [[Independent|Independent]], then $E(XY)=E(X)E(Y)$ so $cov(x,y)=0$. 
- But 0 covariance does not mean independence, since it only captures no *linear* relationships. You could have a *quadratic* relationship, for example.

---
### Examples:
Examples
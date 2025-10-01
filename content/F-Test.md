---
aliases: 
tags:
  - stats/hypothesis_tests
edited: 2025-02-16T18:12
created: 2024-03-19T22:06
---
# Definition:
A test of [[Variance]] between data.

---
# Notes:
##### Use Cases:

###### Population Means
Test that population means are the same for multiple populations under [[Normal Distribution]](s) with equal [[Variance]].
- This a bedrock for [[ANOVA]].

###### Linear Regression
Test whether a [[Linear Regression]] fits the data well


F_{linreg}=\frac{(TSS-RSS)/p}{RSS/(n-p-1)} = \frac{\sigma^2}{\sigma^2} \text{ under } H_0 \text{ else } > 1$

 using the [[Total Sum of Squares]], [[Residual Sum of Squares]], number of samples $n$, and number of features $p$. 

###### Linear Regression Features
Test whether a [[Linear Regression]] with fewer features is better than a linreg with more features.



F_{linreg}=\frac{(RSS_0-RSS)/q}{RSS/(n-p-1)} = \frac{\sigma^2}{\sigma^2} \text{ under } H_0 \text{ else } > 1$


- Note that our $H_0$ is testing that some of the coefficients $\beta_{i \in (q_1,\ q_2, ...)}=0$ and should not be included.
- An F-Test for dropping one coefficient $|q|=1$ is the same as a [[One Sample T-Test]] for if that $\beta=0$.

---
# Examples:
Examples

----
# Source:
Source
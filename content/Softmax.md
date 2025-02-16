---
aliases: 
tags:
  - ds/ml/loss_function
edited: 2025-02-15T16:32
created: 2024-03-19T22:06
---
# Definition:

Function often used to get final output probabilities for [[Classification]].
$$\text{softmax}(a_c)=\frac{e^{a_c}}{\sum_{c'=1}^{C}e^{a_c'}} \forall c \in C$$

---
# Notes:

**Special Case:** When our modeling function $f$ is [[Affine]] ([[Linear Regression]] like $f=b+\boldsymbol{w^T x}$ with parameters $\theta=(b, w)$) then this last softmax is equivalent to [[Logistic Regression]].

---
# Examples:
Examples

----
# Source:
Source
---
aliases:
tags:
  - ds/ml/loss_function
  - ds/ml/nn
edited: 2025-09-03T20:13
created: 2024-03-19T22:06
---
# Definition:

A [[Differentiable Function]] which approximates the $\arg \max$.

Often used to get output probabilities for [[Classification]] in [[Artificial Neural Network|Neural Network]].
$$\text{softmax}(z_c)=\frac{e^{z_c}}{\sum_{c'=1}^{C}e^{z_c'}} \forall c \in C \approx P(Y=c|Z=z)$$

For binomial classification, see [[Sigmoid Function]].

---
# Notes:

### Properties

**Special Case:** When our modeling function $f$ is [[Affine]] ([[Linear Regression]] like $f=b+\boldsymbol{w^T x}$ with parameters $\theta=(b, w)$) then this last softmax is equivalent to [[Logistic Regression]].

### Gradient
We have softmax as $s_i = \frac{e^{x_i}}{\sum e^{x_i}}$. Taking the first derivative with respect to $s_i$, we obtain $\frac{e^{x_i}}{\sum e^{x_i}} \times (1-\frac{e^{x_i}}{\sum e^{x_i}})$, and $-\frac{e^{x_i}}{\sum e^{x_i}} \frac{e^{x_j}}{\sum e^{x_j}}$ for off-diagonal terms as our Jacobian matrix:

$$
\nabla = \begin{bmatrix}
s_1 (1 - s_1) & -s_2 s_1 & ... \\
- s_1 s_2 & s_2 (1 - s_2) & ... \\
\vdots & \vdots & \ddots \\
\end{bmatrix}
% = s_i \left(diag(1) -  \right)
$$

When combined with [[Cross Entropy]], we get the final result that our loss gradient is:
$$\frac{\partial L}{\partial a_{output}} = a_{output} - y_{onehot}$$

### [[Bayesian Learning]] [[Maximum Likelihood Estimation|MLE]] Perspective
When using [[Log Likelihood]], we get the log softmax which is $z_c - \log \sum e^{z_c}$.
- Our input class $z_c$ always appears
- This has strongest performance if the highest probability class is the same as the input class. log penalizes small numbers more.
- This approaches predicting the fraction of counts based in the training data.

---
# Examples:
Examples

----
# Source:
Source
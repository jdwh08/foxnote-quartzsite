---
aliases: 
tags:
  - math
edited: 2025-05-25T11:49
created: 2024-04-04T22:50
---
### Definition:
Function which turns $X\in (-\infty, \infty)$ to $[0,1]$.
$$\sigma(x, \theta) = \frac{1}{1+e^{-\theta^Tx}}$$

$$a \rightarrow -\infty = \ \sigma(a) \rightarrow 0; a \rightarrow +\infty = \sigma(a) \rightarrow 1$$

We might want to set a threshold if this is used for Binary [[Classification]], e.g., 0.5.

---
### Notes:
For a 0.5 threshold, whenever $\theta^T x > 0$, the function is positive, else negative.

Sigmoid also has a nice derivative:
$$\frac{\partial \sigma(x)}{\partial x} = \sigma(x)(1-\sigma(x))$$
- Derivatives get very small when $a$ is very small or very large.

Often used as an old school [[Activation Function]] for [[Artificial Neural Network]]s to convert data into the $[0,1]$ range.

---
### Examples:
Examples
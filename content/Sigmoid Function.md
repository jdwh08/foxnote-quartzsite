---
aliases: 
tags:
  - math
edited: 2024-04-04T22:53
created: 2024-04-04T22:50
---
### Definition:
Function which turns $X\in (-\infty, \infty)$ to $[0,1]$.
$$h(x, \theta) = \frac{1}{1+e^{-\theta^Tx}}$$

We might want to set a threshold if this is used for binary classification, e.g., 0.5.

---
### Notes:
For a 0.5 threshold, whenever $\theta^T x > 0$, the function is positive, else negative.

---
### Examples:
Examples
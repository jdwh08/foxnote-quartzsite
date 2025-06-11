---
aliases: 
tags:
  - ds/ml
edited: 2025-05-25T16:59
created: 2024-03-19T22:06
---
# Definition:
A variant of [[Gradient Descent]] where we conduct gradient descent after only some of data is processed.

$$\Delta w_i=\eta (y-a) x_i\ \forall\ i \in D$$

where $a$ is either $\hat{y}$ or in [[Artificial Neural Network|Neural Network]]s is the activation $wx$.

---
# Notes:
- Needs a smaller learning rate $\eta$ than regular gradient descent.
- Might be able to avoid local minima because it uses the gradients.

---
# Examples:
Examples

----
# Source:
Source
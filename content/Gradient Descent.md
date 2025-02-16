---
aliases: 
tags:
  - ds/ml
edited: 2025-02-15T16:30
created: 2024-04-04T22:45
---
### Definition:
Basic method of training a model.

---
### Notes:
Suppose I have a parameter I want to optimize, $\theta$, and a function $h(X,\theta)$ which I want to optimize.

We can calculate the gradient of the loss function:
$$\nabla = \frac{1}{n} X^T(h-y)$$
to identify the direction to minimize the loss, and then update the parameter theta by taking a step in that direction with size $\alpha$, which is the hyperparameter learning rate.
$$\theta_{t=1} = \theta_{t=0} - \alpha \nabla$$
Finally, we update the loss again to see if it is good enough.

---
### Examples:
Examples
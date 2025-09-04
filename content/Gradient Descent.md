---
aliases:
tags:
  - ds/ml
  - cs/dsa/optimizers
edited: 2025-08-27T23:36
created: 2024-04-04T22:45
---
# Definition:
Basic method of training a model by looking at the first derivative [[Gradient]] for all variables on some [[Loss Function]].

---
# Notes:

### Formal Definition
Suppose I have a parameter I want to optimize, $\theta$, and a function $L(X,W)$ which I want to optimize.

We can calculate the [[Gradient]] of the loss function:
$$\nabla = \frac{1}{n} X^T(h-y)$$
to identify the direction to minimize the loss, and then update the parameter theta by taking a step in that direction with size $\alpha$, which is the hyperparameter learning rate.
$$w_{t=1} = w_{t=0} - \alpha \nabla $$
Finally, we update the loss again to see if it is good enough.

### Mini Batch Gradient Descent
Sometimes we will use a small subset of the data (a *batch*) to do gradient descent with. 
- A full epoch thus becomes a bunch of small batches $M$.
- We approximate the full gradient with a series of batch gradients.
	- More weight updates, with some random error in gradient direction.

$$L= \frac{1}{M} \sum L \left(f(x_i, W), y_i \right)$$

#### [[Stochastic Gradient Descent]] (SGD)
Like Mini-Batch, but taken to the extreme with respect to batch size (e.g., 1 observation).
Technically we are no longer guaranteed to converge.

### Properties
1. [[Learning Rate]] must be properly adjusted throughout training schedule.
2. Guaranteed to converge to some [[Local Optima]] (local minimum loss).
3. In practice these are pretty good and close to the global optima.
	1. This is because most places are [[Saddle Points]] and thus there is still a way to manipulate some $w$ to further reduce loss and not get stuck.

---
# Examples:
Examples
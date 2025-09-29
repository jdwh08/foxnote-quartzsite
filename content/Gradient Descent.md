---
aliases:
tags:
  - ds/ml
  - cs/dsa/optimizers
edited: 2025-09-06T15:09
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

### With Momentum
To solve us potentially getting stuck in low-gradient areas, we can use "momentum"

#### Momentum
We could make update based partially on the prior update size.

$$v_i = \beta v_{i-1} + \frac{\partial \mathcal{L}}{\partial w_{i-1}}$$
$$w_i = w_{i-1} - \alpha v_{i}$$
We calculate the [[Velocity]] of the gradient and update accordingly.
- Velocity acts as a [[Exponential Moving Average]], where we update prior terms by $\beta$
- $\beta$ acts like a [[Discount Rate]].

If we imagine this to be like Physics, we can track the [[Velocity]] of our gradient descent.
Forces that act on us include...
1. The actual [[Gradient]] (e.g., the slope of the slippery surface that we slide down)
2. [[Discount Rate]] $\beta$ reduces our velocity like viscous drag.

##### Nesterov Momentum
A variation on momentum where we...
1. Assume the [[Velocity]] from above is mostly correct so
2. We jump straight to where the velocity says we go
$$\hat{w}_{i-1} = w_{i-1} + \beta v_{i-1}$$
3. And then use this new position of the weights to do the update
$$v_i = \beta v_{i-1} + \frac{\partial \mathcal{L}}{\partial \hat{w}_{i-1}}$$
$$w_i = w_{i-1} - \alpha v_{i}$$

This can ... kinda help converge faster sometimes. 
If our velocity is a good estimate, e.g., a convex function.

---
# Examples:
Examples

---
# Source:
Goodfellow Deep Learning
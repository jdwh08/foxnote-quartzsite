---
aliases:
tags:
  - cs/dsa/optimizers
  - ds/ml/nn/optimizers
edited: 2025-09-06T12:39
created: 2024-03-19T22:06
---
# Definition:
An [[Optimizer]] for the weights in a [[Artificial Neural Network|Neural Network]], where...
1. Each weight gets its own [[Learning Rate]] based on prior [[Gradient]] size.
	1. Larger gradients get higher penalties so we learn on all parameters.
	2. Past gradient is measured with a [[Moving Average]].


We use the statistics on the [[Gradient]] to determine how to reduce [[Learning Rate]] over time.
- These act sort of like the [[Hessian]] to approximate second-order [[Newton-Raphson]].
- We divide by the size of the gradient to act as [[L2 Norm]]alization.
- We apply a [[Discount Rate]] $\beta$ so the size of the gradient is some [[Moving Average]].

---
# Notes:

### Algorithm
1. Obtain a gradient accumulator. This is just the cumulative squared [[Gradient]], with some $\beta$ to make a weighted sum.



G_i = \beta G_{i-1} + (1-\beta) \left( \frac{\partial \mathcal{L}}{\partial w_{i-1}} \right)^2$



2. When updating weights, we divide our [[Learning Rate]] by the square root of the [[Gradient]].



w_{i} = w_{i-1} - \frac{\lambda}{\sqrt{G_i + \epsilon}} \frac{\partial \mathcal{L}}{\partial w_{i-1}}$



### Benefits
NOTE: dividing [[Learning Rate]] $\lambda$ by the [[L2 Norm]] of the [[Gradient]] over some [[Moving Average]].
- High gradient stuff gets a larger division penalty
- Low gradient stuff gets a smaller division penalty
- L2 Norm makes it a valid norm and emphasizes past $i$ iterations which had huge [[Gradient]] more than alternative norms.

The $\beta$ and moving average are what make this different from [[Adagrad Optimizer]].
- We no longer saturate over time!

### Issues
- We can improve on this by actually using **momentum** for weight update instead of raw gradient? This allows us to more easily escape zero-gradient regions.

### Alternatives
- [[Adam Optimizer]]

---
# Examples:
Examples

----
# Source:
- GaTech DL
---
aliases:
tags:
  - cs/dsa/optimizers
  - ds/ml/nn/optimizers
edited: 2025-09-28T23:31
created: 2024-03-19T22:06
---
# Definition:
An [[Optimizer]] for the weights in a [[Artificial Neural Network|Neural Network]], where...
1. Each weight gets its own [[Learning Rate]] based on prior [[Gradient]] size. 
	1. Larger gradients get higher penalties so we learn on all parameters.


We use the statistics on the [[Gradient]] to determine how to reduce [[Learning Rate]] over time.
- These act sort of like the [[Hessian]] to approximate second-order [[Newton-Raphson]]
- We divide by the size of the gradient to act as [[L2 Norm]]alization.

---
# Notes:

### Algorithm
1. Obtain a gradient accumulator. This is just the cumulative squared [[Gradient]]



G_i = G_{i-1} + \left( \frac{\partial \mathcal{L}}{\partial w_{i-1}} \right)^2$



2. When updating weights, we divide our [[Learning Rate]] by the square root of the [[Gradient]].



w_{i} = w_{i-1} - \frac{\lambda}{\sqrt{G_i + \epsilon}} \frac{\partial \mathcal{L}}{\partial w_{i-1}}$



NOTE: essentially dividing [[Learning Rate]] $\lambda$ by the [[L2 Norm]] of the [[Gradient]] over time.
- High gradient stuff gets a larger division penalty
- Low gradient stuff gets a smaller division penalty
- L2 Norm makes it a valid norm and emphasizes past $i$ iterations which had huge [[Gradient]] more than alternative norms.

### Issues
1. Our gradient keeps growing over time, and thus learning rate keeps getting smaller.
	1. We "saturate" the resulting learning rate with enough iterations!

### Alternatives
- [[RMSProp Optimizer]] uses a [[Discount Rate]] to make the gradient accumulation an [[Exponential Moving Average]].

---
# Examples:
Examples

----
# Source:
GaTech DL
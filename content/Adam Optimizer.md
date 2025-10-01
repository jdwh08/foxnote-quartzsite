---
aliases:
  - AMSGrad Optimizer
tags:
  - cs/dsa/optimizers
  - ds/ml/nn/optimizers
edited: 2025-09-06T14:25
created: 2024-03-19T22:06
---
# Definition:
An [[Optimizer]] for the weights in a [[Artificial Neural Network|Neural Network]], where...
1. Each weight gets its own [[Learning Rate]] based on prior [[Gradient]] size.
	1. Larger gradients get higher penalties so we learn on all parameters.
	2. Past gradient is measured with a [[Moving Average]].

2. We use **momentum** instead of the raw [[Gradient]] for weight update.

---
# Notes:

### Algorithm
0. Obtain a momentum. This measures the baseline change of the weights. Ensure that  momentums @ start are not tiny values (causing instability):


v_i = \beta_0 v_{i-1} + (1-\beta_0) \frac{\partial \mathcal{L}}{\partial w_{i-1}}$




\hat{v}_i = \frac{v_i}{1-(\beta_0)^t}$



1. Obtain a gradient accumulator. This is just the cumulative squared [[Gradient]], with some $\beta$ to make a weighted sum. Ensure gradient-accumulators @ start are not tiny values:


G_i = \beta_1 G_{i-1} + (1-\beta_1) \left( \frac{\partial \mathcal{L}}{\partial w_{i-1}} \right)^2$




\hat{G}_i = \frac{G_i}{1-(\beta_1)^t}$



2. We use the momentum for update. We divide [[Learning Rate]] by the [[L2 Norm]] of gradient.


w_{i} = w_{i-1} - \frac{\alpha \hat{v}_i}{\sqrt{\hat{G}_i + \epsilon}}$



NOTE: typically our [[Discount Rate]] for momentum $\beta_0$ is `0.9`, and the [[Discount Rate]] for the [[Gradient]] Accumulator $\beta_1$ is `0.999` .

### Benefits
1. We get both consistent normalization effect of [[RMSProp Optimizer]] and the **momentum**.

### Issues
1. Initial momentum $v_i$ and accumulated gradient $G_i$ can't start at zero! This means we will have strong starting instability (multiplication and division by tiny values).
	1. This is why we need the hat-normalizations for small $t$: $\hat{G}, \hat{v}$.

### Alternatives
1. **AMSGrad Optimizer**: make this process faster by setting the momentum $v_i$ as the $\max$ of either the current momentum $v_i$ or the prior maximum. 
2. [[AdamW Optimizer]]


---
# Examples:
Examples

----
# Source:
GaTech DL
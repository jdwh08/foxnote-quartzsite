---
aliases:
  - Rectified Linear Unit
tags:
  - ds/ml/nn/activation
edited: 2025-09-10T22:06
created: 2024-03-19T22:06
---
# Definition:
An [[Activation Function]] which is zero for negative values and identity for positive values.


..ReLU = \max(0, z)$



---
# Notes:

Provides nice gradient flow as opposed to [[Sigmoid Function]]
- No saturation on the positive side of the curve!
- Cheap to compute!
- It doesn't have issues with vanishing/exploding gradients.
### [[Gradient]]:


..\nabla ReLU = \begin{cases}
	0 \text{ if } x \le 0 \\
	1 \text{ if } x > 0
\end{cases}$


Technically there is a discontinuity but by convention this is set to zero.

As a [[Jacobian]]: 
- It is a [[Diagonal Matrix]], since changing $x_i$ has no impact on $x_j$
- It's also zero if inputs are negative.

### Weight Initialization:
- Set the bias terms to be small positive values like 0.1 so they are initially active.
- ReLU benefits from [[Kaiming Weight Initialization]] instead of the more traditional Xavier.

### Issues
**Dying ReLU** problem, where if values are too negative the resulting gradients are always in the zero region and thus the neuron is essentially dead.

- In practice, this isn't so bad!
	- [[Stochastic Gradient Descent]] and updates from the Hidden Layers can cause the $wx$ input to become positive again and resurrect the neuron.
	- Optimal state is unlikely for all neurons to be zero; thus the gradient from forward layers can be easily passed to current layer due to it being 1.
	- Neuron with clearly negative $wx$ (i.e., very dead) is similar to learned [[Dropout Regularization]], i.e., it "prunes" suboptimal sub-networks and keeps the working parts.
		- Similar to [[Double Descent#The Lottery Ticket Hypothesis]]

### Modifications and Alternatives
- [[Maxout]]: Combine multiple different learned weighs $w$ under $\max$.
- [[Leaky ReLU]]: Set the output to be $\max(0, z) - \alpha \min(0,z)$, so that highly negative values still have some small influence via $\alpha$.
- [[GeLU]] uses the Gaussian distribution instead for a smoother section.

---
# Examples:
Examples

----
# Source:
GaTech DL
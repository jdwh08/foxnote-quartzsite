---
aliases:
  - Minibatch Gradient Descent
  - SGD
tags:
  - ds/ml
edited: 2025-09-14T13:03
created: 2024-03-19T22:06
---
# Definition:
A variant of [[Gradient Descent]] where we conduct gradient descent using a small number of examples, rather than all examples at once.

---
# Notes:

### Formal
If we have some [[Loss Function]] which is additive, e.g., [[Log Likelihood]] ($L=\log p(y|x,w)$):


..J(\textbf{w}) = \mathbb{E}_{\textbf{x}, y \sim \hat{p}} L(\textbf{x}, y, \textbf{w}) = -\frac{1}{n} \sum_{i}^n L(\textbf{x}_i, y_i, w)$


We can then get the [[Gradient]] for [[Gradient Descent]] of the [[Jacobian]]:


..\nabla J(\textbf{w}) = \frac{1}{n} \sum_{i}^n \nabla_{w} L(x, y, w)$


but note that we don't have to have $n$ be the same as the data size for this to still be valid!

Take samples randomly from [[Uniform Distribution]], and do [[Gradient Descent]] on that small batch.


..w' = w - \eta \nabla$



### Properties
- Batch size is **fixed** generally.
- Needs a smaller learning rate $\eta$ than regular gradient descent.
- Might be able to avoid local minima because it uses the gradients.
- Works when the [[Loss Function]] can be decomposed as some sum across training examples.
- SGD is an [[Bias (estimator)|Unbiased (estimator)]] of the true gradient, but with high [[Variance (estimator)]].
- Batches **should be selected randomly**, so shuffle your data.

##### Selecting Batch Size
- Formally speaking, **Stochastic Gradient Descent** is when we do only one observation at once before updating weights.
	- Generalization error is best here.
- Having some small number of observations is **Minibatch Gradient Descent**

- Higher batch size produces slightly more accurate gradient estimates.
	- Stable enough for second-order gradient descent using the [[Hessian]].
	- Good estimates if doing something like [[Pseudo Labelling]] because the labels can depend on the pre-existing batch inputs.
- Smaller batch sizes 
	- May have a regularizing effect from noise (Wilson & Martinez 2003) .
	- Need lower [[Learning Rate]].
	- Need longer runtimes and more compute.
	- Tend to have better "generalization error" (though technically not valid since we reuse data.)

- Based on Compute Resources
	- Very small batches make multiple cores underutilized.
	- If processing in parallel, memory scales with batch size.
	- GPUs like power-of-two batches.

---
# Examples:


----
# Source:
Georgia Tech DL

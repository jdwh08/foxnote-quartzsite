---
aliases:
  - Batch Normalization
tags:
  - ds/ml/nn
edited: 2025-09-14T12:33
created: 2024-03-19T22:06
---
# Definition:
A type of [[Artificial Neural Network]] layer which performs normalization on the values.

---
# Notes:

### Algorithm
1. For each value $x$ in the training data (e.g., mini-batch)
2. Calculate the [[Sample Mean]] and [[Sample Variance]] for each feature dimension.
3. Normalize the data using [[Z-Score]]-like transform (with some $\epsilon$ to avoid div0)



..\hat{a} = \frac{a - \bar{a}}{\sqrt{\sigma_a^2 + \epsilon}}$



We can also have it learn some $\gamma, \beta$ for shift and scale, i.e., run it through a tiny [[Linear Regression]]. 
- Notice with the right values this can perfectly undo the [[Z-Score]]-like transformation



..\hat{a} = \gamma \frac{a - \bar{a}}{\sqrt{\sigma_a^2 + \epsilon}} + \beta$



Standard notation has slope be $\gamma$ and intercept be $\beta$. This kills me.

### [[Gradient]]
This is a [[Differentiable Function]]! Even for the no parameters case, we can still have gradients get scaled here.

### Uses
- BatchNorm is particularly important prior to the nonlinear [[Activation Function]] since it guarantees some statistical properties.
	- We can ensure we are not stuck in a saturated zone of the activation.

### Issues
We are running this with [[Stochastic Gradient Descent]], so each batch of data is slightly different and thus gets normalized slightly differently.
- During inference, we need to store the mean/variance.
- We can have instability if our batches are too small and have unstable mean/variance.
	- Particularly bad if using multiple machines or GPUs, since this splits even further.
	- [`torch.nn.SyncBatchNorm`]([SyncBatchNorm — PyTorch 2.8 documentation](https://docs.pytorch.org/docs/stable/generated/torch.nn.SyncBatchNorm.html)) is a good fix

BatchNorm actually causes some initial Gradient Explosion!
- Deep BatchNorm networks are untrainable *except with [[ResNet]]*

### Alternatives
- Can have specific ones for each layer

---
# Examples:
- Original [[ResNet]] architecture uses BatchNorm before the nonlinear [[ReLU]] layer.

----
# Source:
GaTech DL
[Batch Normalization](https://arxiv.org/abs/1502.03167) (Ioffe and Szegedy 2015) 
---
aliases:
  - Glorot Weight Initialization
tags:
  - ds/ml/nn/init
edited: 2025-09-14T12:20
created: 2024-03-19T22:06
---
# Definition:
A method used to set starting weights for an [[Artificial Neural Network]] which attempts to keep [[Variance]] the same before and after the layer transformation. 

$$\sim \mathcal{U} \left(-\sqrt{\frac{6}{n_{in}+n_{out}}}, +\sqrt{\frac{6}{n_{in}+n_{out}}} \right)$$

i.e., a [[Uniform Distribution]] based on [[Fan In]] and [[Fan Out]].

Alternative: with a [[Normal Distribution]]
$$\sim \mathcal{N} \left(0, \frac{2}{n_{in} + n_{out}} \right)$$

---
# Notes:

### Rationale
This is done so that the [[Variance]] is roughly preserved for starting weights.
- If variance is reduced, we might have vanishing gradients for deeper layers in [[Deep Learning]].
- If variance is increased, we might have exploding gradients for deeper layers.

NOTE: Since initializations are based on [[Fan In]] and [[Fan Out]] (i.e., neuron counts), this is architecture-dependent.

Works pretty well for Activation Function which are [[Sigmoid Function]] or similar (e.g., [[Hyperbolic Tangent]]).

### Deriving the Bounds
Suppose we have a [[Artificial Neural Network|Neural Network]] neuron 
- Weights $w_i \sim iid(0, \sigma^2_w)$
- Inputs $x_i \sim iid(0, \sigma_x^2)$ with some [[Independent and Identically Distributed|IID]] distribution.

Let's impose the following criteria:
- Forward outputs and backwards [[Gradient]] should retain same unit variance.

**Forward pass**: [[Dot Product]]. Note we assume weights and inputs are [[Independent]].
$$y=\sum wx \rightarrow Var(y) = Var \left(\sum_i^{N_{in}} wx \right) = nVar(wx) = n Var(w) Var(x)$$
Thus, to keep $Var(y) = Var(x)$, we need to have $Var(w) = 1/n_{in}$.

**Backwards pass**: Suppose we have some future layer gradient $\delta^{l+1}_j$. Then,
$$\delta_j^l = \sum_{j}^{n_{out}} w_j \delta_j^{l+1} \rightarrow Var \left(\sum_i^{N_{out}} w\delta^{l+1} \right) = nVar(w\delta^{l+1}) = n Var(w) Var(\delta^{l+1})$$
Thus, to keep $Var(\delta^l) = Var(\delta^{l+1}) = 1$, we must have $Var(w) = 1/n_{out}$.

To compromise between the two, we use the [[Harmonic Mean]].
$$Var(W) = \frac{2}{n_{in} + n_{out}}$$
If we use a [[Uniform Distribution]], our [[Variance]] is $1/12(b-a)^2$. We need it to be symmetrical, i.e., $b=-a$ so this becomes $1/3 a^2 = \frac{2}{n_{in} + n_{out}} \rightarrow a = \sqrt{\frac{6}{n_{in} + n_{out}}}$ 

### Alternatives
##### LeCun Weight Initialization
Technically invented first. A special case where [[Fan In]] and [[Fan Out]] are the same.

##### Simplified Empirical
Reasonable approximate results using the [[Normal Distribution]] and [[Fan In]]:
$$N(0,1) * \sqrt{1/(2n_j)}$$
Note that the $2n_j$ is for [[ReLU]], while we use $n_j$ for [[Sigmoid Function|sigmoid]]-style.

### Issues
This doesn't work very well with NONLINEAR or NONSYMMETRIC activations.
- E.g., [[ReLU]] kills the variance of all negative inputs!
	- If we assume half of inputs are negative (e.g., at initialization) then it shrinks variance by 1/2.
	- Thus, Xavier actually causes variance reductions.
- [[Kaiming Weight Initialization]] is a more typical output there.

---
# Examples:
Examples

----
# Source:
GaTech DL
(Xavier Glorot, Yoshua Bengio) 
---
aliases:
  - He Weight Initialization
tags:
  - ds/ml/nn/init
  - todo
edited: 2025-09-24T17:05
created: 2024-03-19T22:06
---
# Definition:
A [[Weight Initialization]] method tuned particularly for [[ReLU]] style activation functions.



\sim N \left( 0, \sqrt{2/n_{in}} \right)$



---
# Notes:

### Derivation
Suppose we have a [[Artificial Neural Network|Neural Network]] neuron 
- Weights $w_i \sim iid(0, \sigma^2_w)$
- Inputs $x_i \sim iid(0, \sigma_x^2)$ with some [[Independent and Identically Distributed|IID]] distribution.

Our z is $z = \sum_n x_i w_i$, and by independence that means $Var(z) = n Var(x) Var(w) = n \sigma^2_w \sigma^2_x$. This depends only on $n$, the [[Fan In]].

Unlike in [[Xavier Weight Initialization]], we assume that we are using [[ReLU]].
- Note that our initialization is symmetric, so about half the weights are negative.
- Going through ReLU means that 1/2 of the variances will be set to 0 (and killed to death)
- Thus, THERE IS NO NEED to also normalize this by $2/(n_{in} + n_{out})$! $2/(1+1) = 2/1 * 1/2$.

Thus, we get away with using a distribution and setting variance to just be $\sqrt{2/n_{in}}$.

---
# Examples:
Examples

----
# Source:
Source
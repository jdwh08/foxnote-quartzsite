---
aliases: 
tags:
  - math
  - ds/ml/nn/activation
edited: 2025-09-22T18:43
created: 2024-04-04T22:50
---
# Definition:
Function which turns $X\in (-\infty, \infty)$ to $[0,1]$.


..\sigma(x, \theta) = \frac{1}{1+e^{-\theta^Tx}}$





..a \rightarrow -\infty = \ \sigma(a) \rightarrow 0; a \rightarrow +\infty = \sigma(a) \rightarrow 1$



- We might want to set a threshold if this is used for Binary [[Classification]], e.g., 0.5.
- For Multiclass Classification, see [[Softmax]]. 

---
# Notes:
For a 0.5 threshold, whenever $\theta^T x > 0$, the function is positive, else negative.

Sigmoid also has a nice derivative:


..\frac{\partial \sigma(x)}{\partial x} = \sigma(x)(1-\sigma(x))$


- Derivatives get very small when $a$ is very small or very large.

Often used as an old school [[Activation Function]] for [[Artificial Neural Network]]s to convert data into the $[0,1]$ range.

Also used for some tasks which prevent things like [[ReLU]] from working well:
- [[Autoencoder]]
- [[Recurrent Neural Network]]

### [[Bayesian Learning]] [[Maximum Likelihood Estimation|MLE]] Perspective
Suppose I have some [[Bernoulli Trial|Bernoulli Distribution]] and we predict $P(y=1|X)$. 
1. We can start by calculating the weighted sum $z = w^T x$. This might not be summing to 1.
2. We can normalize this.
	1. If $\log \tilde{P}(y) = yz$, then $\tilde{P}(y) = e^{yz}$, and when we normalize by dividing by sum we get $P(y) = \frac{e^{yz}}{\sum e^{yz}}$, which apparently is $\sigma(z(2y-1))$.

3. If we take the [[Log Likelihood]], the loss under [[Maximum Likelihood Estimation|MLE]] is basically then the [[Softplus]] $-\log(\sigma(z(2y-1))) = \zeta(z(1-2y))$.
	1. This is only saturated when $z(1-2y)$ is super negative, i.e., when $2yz$ is super positive, i.e., both $z$ and $y$ have the same side, i.e., correct
	2. This makes it better than the [[Mean Squared Error]] approach which can saturate more.

### Issues
1. Gradient is generally saturated (at high enough OR low enough $z$ input). Thus, in [[Deep Learning]] our [[Gradient Descent]] steps will be tiny. "Vanishing Gradients" when going backwards, "Exploding Gradients" when going forwards.

### Alternatives
- [[Hyperbolic Tangent]] is just sigmoid ranging from -1 to 1: $\tanh(z) = 2\sigma(2z)-1$. It also has derivative of 1 near 0, so it approximates linear.
- [[ReLU]] is a piecewise alternative

---
# Examples:
Examples

---
# Source:
Goodfellow Deep Learning
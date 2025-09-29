---
aliases: 
tags:
  - ds/ml/nn/activation
edited: 2025-09-24T17:05
created: 2024-03-19T22:06
---
# Definition:
[[Activation Function]] like [[ReLU]] which has multiple $w$ weights which are $\max$ together.

This essentially creates piecewise approximation to true best activation function.

---
# Notes:
1. **Maxout Unit** is basically just a small [[ReLU]].
	1. Note that unlike in ReLU, **not all neurons are connected into the unit**!
	2. This is like built in [[Dropout Regularization]].
2. **Maxout Units** have weight attached to them and are fed through some final function.

Technically with enough $k$ values to max together, this is also a universal approximator!
- Any function $g(v)$ can be written as the difference between two convex functions $h_1(v) - h_2(v)$. 
- We can pretend our $h$ values are the maxout units, with a $+1$ and $-1$ weight.

### Issues
Eh... in practice this is more complex than you need, and [[ReLU]] gives acceptable on-par performance
- ReLU + MaxPool in [[Convolutional Neural Network|CNN]] acts basically like a MaxOut in structure.

---
# Examples:
Examples

----
# Source:
Goodfellow Deep Learning
- Goodfellow is biased since he kinda introduced MaxOut activation...

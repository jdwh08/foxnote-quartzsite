---
aliases:
  - Neural Network
tags:
  - ds/ml/nn
edited: 2025-02-22T14:44
created: 2024-03-19T22:06
---
# Definition:
A ML model which consists of "neurons" that take in various inputs as a weighted [[Linear Combination]], and apply a nonlinear transformation function to feed to other neurons.

![[Artificial Neural Network.excalidraw.png.png]]

---
# Notes:
Formally, we can calculate this as
$$a=\sum_i^{M}w_ix_i$$
where a is our pre-activation, and then apply
$$y=f(a)$$
where $f(a)$ is our [[Activation Function]].


---
# Examples:
Examples

----
# Source:
Bishop Deep Learning

Invented by McCulloch and Pitts, 1943
---
aliases:
tags:
  - ds/ml/nn/cnn
  - math/linear_algebra
edited: 2025-09-28T20:39
created: 2024-03-19T22:06
---
# Definition:
A method of "mixing" two [[Matrix]] together.

Given two matrix $x$ and a Kernel Matrix $k$ of size $(k_1, k_2)$:
$$f(r, c) = (x*k)@(r,c) = \sum_{a=0}^{k_1-1} \sum_{b=0}^{k_2-1} x@(r+a, c+b)\cdot k@(a,b)$$

---
# Notes:

### Uses
- [[Convolutional Neural Network|CNN]] convolution is often coded as Cross Correlation, since the kernel is learned anyway so it doesn't matter much

### Alternatives
Closely related to the idea of [[Convolution]]. However, convolution flips the Kernel matrix before doing the operation.

---
# Examples:
Examples

----
# Source:
GaTech DL

---
# Flashcards:
Q?A

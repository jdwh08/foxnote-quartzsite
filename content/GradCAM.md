---
aliases:
tags:
  - ds/ml/nn/viz
  - readings
edited: 2025-09-29T17:37
created: 2024-03-19T22:06
---
# Definition:
A method for [[Visualizing Neural Networks]] with [[Convolutional Neural Network|CNN]] [[Gradient]].

---
# Notes:
1. Feed image through convolutions, keep final layer kernels
	1. Run it through the final task head (doesn't have to be image classification)
2. Get backprop for gradients up to the the final layer kernels
3. Find important channels via per-channel weighting
	1. Global Average Pooling (sum) and normalize with average
	2. Multiply channel by weight
	3. Apply [[ReLU]]
4. Multiply importance with Guided Backpropagation results to get area of important pixels.

---
# Examples:
Examples

----
# Source:
GaTech DL
Grad-CAM ([Selfvaraju et al 2016](https://arxiv.org/abs/1610.02391))

---
# Flashcards:
Q?A

---
aliases:
  - Neural Network
tags:
  - ds/ml/nn
edited: 2025-04-26T13:12
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


Scaling this up, we can say the neural network has the form
$$f(X) = \beta_0 + \sum_{k=1}^K \beta_k g(w_{k0} + \sum_{j=1}^p w_{kj} X_j)$$
where we see our $g$ as activation functions and our $\beta$s as per-neuron weights.

---
# Examples:

#### MNIST Digit Classifier:
- Given handwritten digits which are 28x28 pixels (greyscale) ranging from 0-255. Must classify which digit it is.
- 60,000 training images, 10,000 test images.
- We store pixels as X in some order, and output as Y.
- Model Architecture:
	- Input layer is 784 units (28 * 28)
	- Hidden layer 1 is 256 neurons (784+1 * 256 = 200,960 weights)
	- Hidden layer 2 is 128 neurons (128 + 1 * 10 = 1,290 weights)
	- Output layer is 10 classes
	- 235,146 total weights.
	- Activations are [[ReLU]] except for HL2 which is [[Sigmoid Function]].
- We find parameter estimates that minimize the negative [[Log Likelihood]]: $- \sum_{i=1}^n \sum_{m=0}^9 y_{im} \log(f_m(x_i))$, aka [[Cross Entropy]].

----
# Source:
Bishop Deep Learning
ISL Python

Invented by McCulloch and Pitts, 1943
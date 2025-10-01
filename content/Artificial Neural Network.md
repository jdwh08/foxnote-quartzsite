---
aliases:
  - Neural Network
tags:
  - ds/ml/nn
edited: 2025-09-30T21:59
created: 2024-03-19T22:06
---
# Definition:
A ML model which consists of "neurons" that take in various inputs as a weighted [[Linear Combination]], and apply a nonlinear transformation function to feed to other neurons.

![[Artificial Neural Network.png]]

Very loosely inspired by biological brains, though not quite the same. 

---
# Notes:

## Formal Definition of Neurons
Formally, we can calculate this as
$$z=\sum_i^{M}w_ix_i$$
where $z$ is our pre-activation, and then apply
$$a=f(z)$$
where $f(a)$ is our [[Activation Function]].

Scaling this up, we can say the neural network has the form
$$f(X) = \beta_0 + \sum_{k=1}^K \beta_k g(w_{k0} + \sum_{j=1}^p w_{kj} X_j)$$
where we see our $g$ as activation functions and our $\beta$s as per-neuron weights.

## What is it Good For?
- Complex input data (vision, sound, language, ...)
- Noisy data.
- Long training times are okay. Inference is fast.
- Interpretability doesn't matter very much.

Large ANNs act as a substitute for hand-crafted rules or more basic ML algorithms.

## [[Model Bias]]
- **Restriction Bias**: If complex enough, almost nothing. 
	- A **linear** set of inputs where we learn planes for each neuron. The combination of neurons then have non-linear functions allowing representation of almost any function.
	- Can represent any continuous or arbitrary function if given enough nodes and layers. E.g., see [[Perceptron#Perceptron Function Representation]].
	- Practically speaking, each architecture does have a set number of neurons and layers.
	- Avoid [[Overfitting]] using network size, [[Train Test Split|Cross Validation]], etc. so that we can stop training once our weights become large and overfit.
- **Preference Bias**: 
	- We generally don't want [[Overfitting]]
	- In neural networks, complex overfitting models tend to have more neurons, layers, and crucially **large weights**.
	- Thus, well-trained ANNs prefer "low complexity": if we have the same value(s), prefer the less complex solution.


## Architectures for Neural Networks
#### [[Perceptron]]
The simplest example of an Artificial Neural Network: the activation function is a simple threshold (or at most a [[Sigmoid Function]]).

Can be trained with the perceptron rule, but more robustly [[Gradient Descent]] with [[Backpropagation]].

#### [[Multilayer Perceptron]]
An extension of perceptrons into multiple layers.

#### [[Deep Learning]]
###### [[Convolutional Neural Network]]
###### [[Recurrent Neural Network]]


## [[Neural Network Training]]


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
- We find parameter estimates that minimize the negative [[Log Likelihood]]: $- \sum_{i=1}^n \sum_{m=0}^9 y_{im} \log(f_m(x_i))$, aka [[Log Loss]].

----
# Source:
Bishop Deep Learning
ISL Python
GaTech ML
GaTech DL

Invented by McCulloch and Pitts, 1943
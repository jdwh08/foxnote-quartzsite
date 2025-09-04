---
aliases:
  - MLP
tags:
  - ds/ml/nn/mlp
edited: 2025-09-03T19:42
created: 2024-03-19T22:06
---
# Definition:
A [[Artificial Neural Network|Neural Network]] which consists of multiple [[Perceptron]]s in a layer, and multiple layers.
- Note that these Perceptrons now can have any [[Activation Function]].

---
# Notes:

### Properties
1. Feedforward: Information goes from $x$ through the layers and out to $y$ without any looping connections back into the network.
	1. Alternatives are [[Recurrent Neural Network]].
2. Network: composed of multiple different functions together into a [[Directed Acyclic Graph]].
	1. Each perceptron is a weighted sum, which is then composed by an activation function and passed to the next layer.
3. Width and Depth: MLPs have a number of layers (depth) and number of neurons in a layer (width)
4. [[Activation Function]]: To express nonlinear functions, a nonlinear activation function is used just like in [[Perceptron]].
	1. In [[Deep Learning]], we typically will choose some broad class of function and learn the weights and parameters for its inputs. This is usually better than hand-engineering or nonparametric like the RBF Kernel in SVM.
	2. $g(w^T x + b)$

### Training
Mostly the same as [[Artificial Neural Network]].
- [[Gradient Descent]], because typically the loss function becomes non-convex and thus hard to solve analytically.
- Must initialize weights to small random values.
	- [[Kaiming Weight Initialization]]
	- [[Xavier Weight Initialization]]
- Specify a [[Loss Function]].
	- Often times, doing [[Maximum Likelihood Estimation]] on classification which gives the typically [[Cross Entropy]] logloss.
	- 

---
# Examples:
Examples

----
# Source:
Source
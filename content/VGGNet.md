---
aliases:
tags:
  - ds/ml/nn/cnn
edited: 2025-09-29T16:58
created: 2024-03-19T22:06
---
# Definition:
Notable successful [[Convolutional Neural Network|CNN]] model used to classify images on the ImageNet dataset. 

---
# Notes:

### Motivation
- Can we do better than [[AlexNet]] by scaling up the size?
	- Trained a bunch of variants
- Can we organize deeper networks via repeating "blocks" of layers?
	- E.g. a repeated sequence of 3x3 convolution kernels are a good substitute
	- Larger convolutions, like a 11x11, end up with too many parameters particularly at high number of channels.
	- Also, small stride means we don't lose as much information.

### Architecture
##### Convolution Block:
Two 3x3 convolutions are similar to a larger 7x7 convolution.

2. Input images of size 224 x 224 x 3
3. [[Convolutional Neural Network|CNN]] convolution block.
	1. 3x3 convolution, 64 channel output (N, 224, 224, 64)
	2. 3x3 convolution, 64 channel output
	3. 2x2 Max Pool
4. [[Convolutional Neural Network|CNN]] convolution block.
	1. 3x3 convolution, 128 channel output (N, 112, 112, 128)
	2. 3x3 convolution, 128 channel output
	3. 2x2 Max Pool (N, 56, 56, 128)
5. [[Convolutional Neural Network|CNN]] convolution block.
	1. 3x3 convolution, 256 channel output (N, 56, 56, 256)
	2. 3x3 convolution, 256 channel output
	3. 3x3 convolution, 256 channel output
	4. Max Pool (N, 28, 28, 256)
6. [[Convolutional Neural Network|CNN]] convolution block.
	1. 3x3 convolution, 256 channel output (N, 28, 28, 512)
	2. 3x3 convolution, 256 channel output
	3. 3x3 convolution, 256 channel output
	4. 2x2 Max Pool (N, 14, 14, 512)
7. [[Convolutional Neural Network|CNN]] convolution block.
	1. 3x3 convolution, 256 channel output (N, 14, 14, 512)
	2. 3x3 convolution, 256 channel output
	3. 3x3 convolution, 256 channel output
	4. 2x2 Max Pool (N, 7, 7, 512)
8. [[Multilayer Perceptron|MLP]]
	1. Linear [[ReLU]] Output 4096. (7x7x512x4096)
	2. Linear [[ReLU]] Output 4096.
	3. Linear [[ReLU]] Output 1000 (one per class)

### Properties
1. Most of the memory usage is in the convolutional layers, thanks to the high number of channels.
2. Most of the parameters are in the fully connected linear layers.

### [[Visualizing Neural Networks]]
- Used Deconvolution (similar to Guided Backprop) to get important pixels from each layer.
- Layer 1: Edges, colours, repeated dot textures
- Layer 2: Corners, circles, fine lines and parallel line textures
- Layer 3: Humans, repeated geometric tiles, car wheels, bar codes, etc.
- Layer 4/5: Specific object types, e.g., dogs, emus, typewriters, etc.

---
# Examples:
Examples

----
# Source:
GaTech DL
Paper: Simonyan & Zimmerman, Very Deep Convolutional Networks for Large Scale Image Recognition

---
# Flashcards:
Q?A

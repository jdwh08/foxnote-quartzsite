---
aliases:
tags:
  - ds/ml/nn/cnn
edited: 2025-09-28T22:14
created: 2024-03-19T22:06
---
# Definition:
Notable successful [[Convolutional Neural Network|CNN]] model used to classify images on the ImageNet dataset. 

---
# Notes:

### Motivation
- ImageNet was a huge dataset of 15M labelled images, much larger than prior datasets like CIFAR or MNIST at 100K. 
- Prior work was done using hand-built filters like [[SIFT]] and more conventional [[Computer Vision]] techniques.
- Could we learn these filters (kernels) via data alone and do better, e.g., with [[Convolutional Neural Network]]s?

### Architecture
Technically speaking this was split into two CNNs, one on each GPU, because of VRAM limitations.

1. Input images of size 227 x 227 x 3
2. [[Convolutional Neural Network|CNN]] layer.
	1. [[Convolution]]: Kernels of size 11 x 11. Stride 4. Pad 0. 3 input channels. 96 output channels. Shape: (N, 96, 55, 55)
	2. [[ReLU]]
	3. MaxPool: 3 x 3. Stride 2. Shape: (N, 96, 27, 27)
	4. Weird Normalization Layer.
3. [[Convolutional Neural Network|CNN]] layer.
	1. [[Convolution]]: Kernels of size 5 x 5. Stride 1. Pad 2. 96 input channels. 256 output channels. Shape: (N, 256, 27, 27)
	2. [[ReLU]]
	3. MaxPool: 3 x 3. Stride 2.
4. [[Convolutional Neural Network|CNN]] layer.
	1. [[Convolution]]: Kernels of size 3 x 3. Stride 0. Pad 1. 256 input channels. 384 output channels. Shape: (N, 384, 13, 13)
	2. [[ReLU]]
	3. [[Convolution]]: Kernels of size 3x3. Stride 0. Pad 1. 384 input channels. 384 output channels. Shape: (N, 384, 13, 13)
	4. [[ReLU]]
	5. [[Convolution]]: Kernels of size 3x3. Stride 0. Pad 1. 384 input channels. 256 output channels. Shape: (N, 256, 13, 13)
	6. [[ReLU]]
	7. MaxPool: 3 x 3. Stride 2.
5. [[Multilayer Perceptron|MLP]]
	1. Linear [[ReLU]] Output 4096.
	2. Linear [[ReLU]] Output 4096.
	3. Linear [[ReLU]] Output 1000 (one per class)

### Improvements
1. First network to use [[ReLU]] instead of more common sigmoid
2. Specialized normal layers (not used today)
3. [[Principal Component Analysis|PCA]] for data augmentation (not used today)
4. First network to use [[Dropout Regularization]]
5. They actually trained 7 randomly and used [[Ensemble (Machine Learning)]]

### Issues
1. We're using rather large starting kernels, which quickly reduces our size. This also makes the number of parameters in the convolution small relative to the linear layers.
2. We could uh always add more parameters.

### Improvements
- **[[VGGNet]] (2014)** from Oxford scales AlexNet up. 
	- It uses 3x3 kernels instead, and goes up to 16 and 19 layers.
- [[ResNet]] (2015) makes CNNs learn the residuals instead, allowing for easier learning.

---
# Examples:
Examples

----
# Source:
[ImageNet Classification with Deep CNNs](https://proceedings.neurips.cc/paper_files/paper/2012/file/c399862d3b9d6b76c8436e924a68c45b-Paper.pdf) (Krizhevsky, Sutskevar, Hinton 2012)
---
aliases:
tags:
  - ds/ml/nn/cnn
edited: 2025-09-29T18:39
created: 2024-03-19T22:06
---
# Definition:
A type of [[Image Generation]] task which tries to have the content of one image and the style (texture) of another image.

---
# Notes:

### Method
1. Generate images via [[Backpropagation]].
2. Match features at different layers of the [[Convolutional Neural Network|CNN]]
3. We want to represent style similarity  
	1. Summary statistics of image should be similar.
	2. This removes spatial information but keeps other stuff.
	3. **[[Gram Matrix]]**: 
		1. Get two channels in the [[Convolutional Neural Network|CNN]] 
		2. Perform element-wise multiplication between the channels for each element. This is the Gram value.
	4. Style loss is the [[Mean Squared Error|MSE]] between the [[Gram Matrix]]
4. Use a [[Loss Function]] which is the [[Mean Squared Error|MSE]] between input image and the generate image at each layer.
	1. Need to have loss for both *content* network and *style* network
	2. Sum across all layers

### Uses
1. Art generation.
2. Stylization helpful for seeing what the network has learned
3. Also helpful for [[Synthetic Data|Data Augmentation]]

---
# Examples:
Examples

----
# Source:
GaTech DL

---
# Flashcards:
Q?A

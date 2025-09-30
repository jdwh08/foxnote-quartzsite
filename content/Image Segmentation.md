---
aliases:
tags:
  - cs/task/image
edited: 2025-09-30T14:11
created: 2024-03-19T22:06
---
# Definition:
A type of image processing task which divides images into pixels for [[Classification]].

---
# Notes:

### Types
- [[Semantic Image Segmentation]]: Predict a class distribution per pixel
	- Image-to-image. Output is same dimension as input, with pixels corresponding to class distributions.
	- We can think of this like an [[Encoder-Decoder]] style
	- **How do we convert [[Convolutional Neural Network|CNN]] lower dimensional output into original image?**
		- Convert the final linear layers into convolution layers (one giant kernel)
		- Applying the standard convolution makes it able to handle other input shapes.
- [[Instance Image Segmentation]]: Predict class distribution per pixel, with unique IDs per object.
- [[Object Detection]]: Find the bounding boxes of objects in image, along with class probabilities.

---
# Examples:
Examples

----
# Source:
Source

---
# Flashcards:
Q?A

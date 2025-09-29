---
aliases:
  - Data Augmentation
tags:
  - ds/ml/featureeng
edited: 2025-09-06T13:33
created: 2024-03-19T22:06
---
# Definition:
A process to artificially increase the size of the training data via some transformations.
- Ideally makes the training data more general and representative.
- Transformation MUST NOT CHANGE THE LABEL!

---
# Notes:
Notes

---
# Examples:

### Text For [[Large Language Models]]

### Images For [[Convolutional Neural Network]]
1. We can take images and perform non-destructive transformations which still keep the labels.
	1. Geometric Transformations:
		1. Rotation, Flipping, Translation, Scaling
		2. NOTE: this robustness depends on what the task is, e.g., maybe a 270deg rotation is not valid.
	2. Cropping (both on train and test), etc.
		1. On Train makes it less dependent on any patch of pixels.
		2. On Test ensures it has labels which are more generalized
		3. CutMix combines multiple different images together.
		4. CowMix takes some blobby mask (like the spots of a cow) and replaces the spots with either random noise or some unlabelled image.
			1. If a mixture of images, we can set ground truth to be a mixture of labels based on number of pixels.
	3. Colour Jitter changes the colour mix (hue, saturation, brightness)
	4. Combination of all the above.

----
# Source:
GaTech DL
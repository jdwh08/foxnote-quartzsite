---
aliases:
tags:
  - ds/ml/nn/autoencoder
  - ds/dimension_reduction
edited: 2025-09-28T22:54
created: 2024-03-19T22:06
---
# Definition:
A [[Artificial Neural Network|Neural Network]] which uses [[Dimension Reduction]] via [[Unsupervised Machine Learning]] to learn a small representation of the input data

- "encoder" which reduces data to some small [[Embeddings]] in [[Latent Space]]
- "bottleneck", the [[Embeddings]]
- "decoder" which converts [[Embeddings]] back to original data

Where the goal is to minimize **[[Reconstruction Loss]]** of the original data (like [[Principal Component Analysis|PCA]]). 
- Small embedding should have much more signal-to-noise.

---
# Notes:

### Structure
- Intermediate [[Embeddings]] are in a learned [[Latent Space]].

### Training
- Determine a [[Distance Measure]] between input and output as our [[Loss Function]], e.g., [[Mean Squared Error|MSE]] on pixel values.
- Choose the [[Embeddings]] size / "latent dimension" as the number of neurons in the bottleneck.
	- Too small means difficultly passing enough information to learn reconstruction. (High [[Model Bias]]).
	- 

### Applications

##### [[Dimension Reduction]]. Duh.
- Embedding dimension should be smaller than training data features.
- We can then apply [[Clustering]] or [[Classification]]!

##### [[Denoising Autoencoder]]
- Instead of using the same data for inputs and outputs, we can give noisy inputs and clear outputs.
- This makes the Autoencoder learn how to "denoise" inputs.
- Denoising can also be used for [[Diffusion Model]]

##### [[Anomaly Detection]]
- We can use autoencoders to find when inputs do not "fit" the [[Latent Space]].

##### [[Image Segmentation]]
- For images, use [[Convolutional Neural Network|CNN]] as both encoder and decoder, where output is the ground truth segmented images.

### Issues
1. **Reconstruction might not be what you want.**
	1. If doing this for [[Classification]] or [[Information Retrieval]], the [[Embeddings]] might have less separation or worse defined clusters.
	2. [[Interpolation]] between points in latent space does NOT necessarily line up with clusters or classes.
2. **Issues with Noise**
	1. A basic Autoencoder has issues handling noisy images or changes to input.

### Improvements
- Convolutional Autoencoder: Using [[Convolutional Neural Network]] with [[Convolution]]
- [[Variational Autoencoder]]: Try to apply regularization to the [[Latent Space]] so that it is better behaved.

---
# Examples:
- Convolutional Autoencoders for images:
	- We use an encoder to learn a representation of the image.
	- We can then use it for [[Image Upscaling]] or [[Image Colourization]].
		- E.g., sending / receiving images
	- [[U-Net]] model for image segmentation.

----
# Source:
Source
---
aliases:
tags:
  - ds/ml
edited: 2025-09-09T16:52
created: 2024-03-19T22:06
---
# Definition:
A [[Machine Learning]] problem which contains elements of both [[Unsupervised Machine Learning]] and [[Supervised Machine Learning]]

---
# Notes:
### Problem Setup
Suppose we have a small amount of labelled data, plus a large amount of unlabelled data.

### Pipelines
1. [[Variational Autoencoder]] + [[Classification]]
	1. [[Unsupervised Machine Learning]]: Train a [[Variational Autoencoder]] on the unlabelled example data to learn the [[Latent Space]] $z$.
	2. Within the [[Latent Space]], train a small classifier on the labelled data points.
		1. Because we did [[Dimension Reduction]] with the VAE, it's easier to learn!
	3. Fine Tune the combined encoder+classifier.
		1. Metrics: VAE Reconstruction Loss, Classification Rate

2. Psuedo Labelling

---
# Examples:


----
# Source:
Source
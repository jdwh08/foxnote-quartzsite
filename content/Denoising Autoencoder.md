---
aliases:
tags:
  - ds/ml/nn/autoencoder
  - ds/denoising
edited: 2025-09-26T14:00
created: 2024-03-19T22:06
---
# Definition:
A type of [[Autoencoder]] used to learn how to [[Denoise]] input data. 
- Note that input has *noise* applied, and output is the *denoised* version.

---
# Notes:

### Training
##### Data Manipulation for Images
1. Add noise, e.g., white noise, across the image.
2. Mask parts of the input and have it learn to reconstruct, i.e., [[Image Inpainting]]

---
# Examples:
Examples

----
# Source:
Arxiv Insights
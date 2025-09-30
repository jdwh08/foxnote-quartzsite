---
aliases:
tags:
  - ds/ml/nn/viz
  - todo/breakup
edited: 2025-09-30T14:16
created: 2024-03-19T22:06
---
# Definition:
Visualizing the results of a [[Artificial Neural Network|Neural Network]] to understand what it learned.

---
# Notes:

## [[Convolutional Neural Network|CNN]]

#### Visualizations for Layers
- We can visualize them since we are dealing with images.
- Linear layer: take the learned weights, reshape them into images, normalize, project
	- For the final linear layers, this should be equivalent to learning the pixels!
- Convolution layer: Normalize values and just visualize the kernel! 
	- We can see things like edges.
	- These structures mirror real neurons from the brain (v1 [[Primary Visual Cortex]])
	- Can have repeated kernels. Can be hard to interpret (e.g., 3x3).

#### Output Maps
Plot the activations for a kernel. This gives the high values.
- Roughly correspond to image size at that layer. I.e., larger earlier on.
- We can identify for a given layer and given kernel what the top images are for that activation.
	- Small features are also hard to interpret.
- Can also use [[Dimension Reduction]] techniques, like [[t-SNE]] or [[Uniform Manifold Approximation and Projection|UMAP]].

#### [[Gradient]]s
Visualize how loss changes as we change input... for all layers or for a specific layer.
Deep Inside Convolutional Networks (Simonyan 2013)

- Important for both good model training and explainability.
- It's actually easier to find gradient of the *scores* instead of the *loss*. Also do [[Absolute Value]] and sum across colour channels.

###### Saliency Maps
- Map of gradient with respect to input pixels.
	- **High gradient suggest important pixels**.
	- Can use traditional [[Image Segmentation]] algorithms to get free segmentation! (it's not quite as good, but it's free / emergent)
	- Can show [[Data Bias]], e.g., learning the [[Correlation (Pearson)|Correlation]] with background instead of learning the object. Why Should I Trust You (Riberio et al)
- Can also do this for a specific neuron via [[Backpropagation]], and also find highest activated image patches.

###### [[Transposed Convolution Layer]] and Guided [[Backpropagation]]
- A type of [[Backpropagation]] which is focused on only doing some of the operations.
- Here, we might only want to visualize positive contributing weights, and skip negative. Allows us to focus on specific contribution pixels.

#### Robustness and Attaacks
###### [[Image Generation]]
Optimize the image to get the best model scores.
- Can create [[Adversarial Example]] which is of the wrong class or value.
- Optimize via [[Gradient Descent]] on the negative raw scores (final or specific kernel), plus some [[Regularization]] to control how much the image values change.
- Can apply [[Gradient Clipping]] and value clipping, add [[Gaussian Blur]], etc.

If we start with an image, it's surprisingly easy to add a small amount of noise to make model confidently wrong.
- Sufficient to just have linearity anywhere. Adding tiny values across tons of dimensions.
- We can even have **One Pixel Attack!** (Su et al 2019)

Adversarial Attacks and Defenses, a Survey (Chakraborty et al 2018)
###### Types of [[Adversarial Model Attack]]
1. White Box: given model architecture and weights, perform gradient optimization.
2. Black Box, Non Adaptive: 
3. Black Box, Adaptive: 
4. Black Box, Strict. Hard: 

###### Types of Attack Goals
1. Confidence reduction. Easy.
2. Misclassification.
3. Targeted Misclassification.
4. Source / Target Misclassification.

###### Types of Attack Types
1. Logic Corruption
2. Data Modification
3. Data Injection

###### Types of Defenses
Note these are not universally robust.

1. Training with [[Adversarial Example]]
2. Training with [[Synthetic Data|Data Augmentation]]: pertubations, add noise, re-encode inputs, etc.

### Issues
- For [[Convolutional Neural Network|CNN]]: this can sometimes be misleading or informative (e.g., visualizing only a small number of channels). Adebayo et al 2018
	- Need **user studies** to show usefulness, e.g., if we can use this to *predict* mistakes beforehand
	- CNNs use distributed representation, so single nodes represent multiple features. Can be difficult to interpret.

---
# Examples:
- [CNN101](https://poloclub.github.io/cnn-explainer) for kernel images
- [[GradCAM]] for gradient based

----
# Source:
GaTech DL
Understanding Neural Networks through Deep Visualization ([Yosinski et al 2015](https://arxiv.org/abs/1506.06579))


---
# Flashcards:
Q?A

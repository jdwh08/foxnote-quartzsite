---
aliases:
  - CNN
tags:
  - ds/ml/nn/cnn
edited: 2025-04-26T15:24
created: 2024-03-19T22:06
---
# Definition:
A type of [[Artificial Neural Network|Neural Network]] which works by repeatedly finding small local patterns and then aggregating up.

Most useful for image-based tasks.

---
# Notes:

## Layers
#### Convolution Layer
- Convolution is multiplying matrix elements and then adding results.
- Uses lots of convolution filters as baseline to find local features.
![[Convolution.excalidraw.png.png|265x358]]
- If the image matches the convolution well, it will have a high value!
	- Note that convolutions can be any dimension so long as they are small.
- Convolutions can pick up local edges, shapes, etc. and are **learned by the CNN**.
	- Highly localized patches (many zeros)
	- Same weight reused.
- If there are multiple values per pixel (e.g., colours, previous layer convolution results) we treat them as separate channels and define our convolution map across them.
- Activations are typically [[ReLU]], sometimes called a **Detector Layer**

#### Pooling Layer
- Aggregates lower level convolution features together into a higher level
	- Reduce feature size
	- Provide some local-level location invariance, i.e., as long as high value somewhere near there, is good enough.
- **Max Pooling**: For each 2x2 block of values, return the highest value.

## CNN Architecture
- Many stacks of Convolution -> Pooling
- Continue until pooling results in a very small dimension. Then, flatten this and feed results into normal [[Artificial Neural Network|Neural Network]], e.g., MLP followed by [[Softmax]].


## Data Augmentation
To ensure CNNs learn well, we can take each input (e.g., image), and then distort it slightly while still being recognizable (e.g., scale, rotate, flip, shear, etc.)
- Acts similar to [[Ridge Regularization]]?

---
# Examples:
Examples

----
# Source:
ISL Python
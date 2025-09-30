---
aliases:
  - Deconvolution Layer
  - Fractionally Strided Convolution
tags:
  - ds/ml/nn/cnn
edited: 2025-09-30T14:31
created: 2024-03-19T22:06
---
# Definition:
A type of [[Convolution]] operation in a [[Convolutional Neural Network|CNN]] which increases the output size by upsampling. Useful for setting the output size the same as the input after [[Convolutional Neural Network|CNN]].

---
# Notes:
Similar to "undoing" a convolution operation.

Effectively the same thing as adding zeros between values in the input, then doing a [[Convolution]] with the kernel $K$.
- We have parameters in the kernel $K$ which makes this "learnable upsampling".

- We can control it with a $S$ stride parameter, and we add $S-1$ zeros between inputs.
- Padding is also reversed, i.e., we remove $p$ outer rows and columns from the output.

### Implementation
```python
def trans_conv(X: torch.tensor, K: torch.tensor):
    h, w = K.shape
    Y = torch.zeros((X.shape[0] + h - 1, X.shape[1] + w - 1))
    for i in range(X.shape[0]):
        for j in range(X.shape[1]):
            Y[i: i + h, j: j + w] += X[i, j] * K  # stamp kernel to input
    return Y
```

### Usage
- [[Semantic Image Segmentation]]: final output in this task must be same size as input.

### Alternatives
See [[Unpooling Layer]] for a similar inverse for pooling layers.

---
# Examples:

### Simple Example
Given


----
# Source:
[Dive into Deep Learning D2L](https://d2l.ai/chapter_computer-vision/transposed-conv.html)
[Stanford CS321n Winter 2016](https://www.youtube.com/watch?v=ByjaPdWXKJ4&t=1019s)
GaTech DL

---
# Flashcards:
Q?A

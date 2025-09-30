---
aliases:
tags:
  - ds/ml/nn/cnn
edited: 2025-09-30T14:28
created: 2024-03-19T22:06
---
# Definition:
The inverse of a [[Pooling Layer]]. Given a single input representation, expand it to multiple output values.

---
# Notes:

### Types
##### Max Unpooling
We are given the maximum value. 
- Can save the *position* of the maximum value (saved from earlier), and set rest to zeros.


### Usage
##### [[Convolutional Neural Network|CNN]]
Can be combined with [[Transposed Convolution Layer]] to create the "decoder" in an [[Encoder-Decoder]] setup. Useful for tasks where the output is similar to input size, e.g., [[Image Segmentation]].

---
# Examples:

### 2x2 Max Unpooling for a [[Convolutional Neural Network|CNN]]:
Input $X$: 

| 120  | 150** | 120  |
| ---- | ----- | ---- |
| 100* | 50    | 110* |
| 25   | 25    | 10   |

We can see the max positions marked by asterisks. We can then uses these positions for some new input which we want to "expand":

Compressed $X$:

| 300 | 450 |
| --- | --- |
| 100 | 250 |

In **max unpool**, 300 gets mapped to the top right, our 450 gets mapped to the top left, our 100 gets mapped to the top left, and our 110 gets mapped to the top right:

| 0   | 300+450 | 0   |
| --- | ------- | --- |
| 100 | 0       | 250 |
| 0   | 0       | 0   |

----
# Source:
Source

---
# Flashcards:
Q?A

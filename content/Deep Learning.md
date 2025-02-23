---
aliases: 
tags:
  - ds/ml/nn
edited: 2025-02-22T15:24
created: 2024-03-19T22:06
---
# Definition:
A type of [[Artificial Neural Network|Neural Network]] which expands on [[Perceptron|Multilayer Perceptrons]] by effectively using more than two layers.

---
# Notes:
For training, requires massively linked GPUs with huge datasets and scale. 
Generally outperforms other approaches when given enough data and compute: [[The Bitter Lesson (Machine Learning)]].

#### The Hidden Layers
What are the hidden layers doing?
- Representation Learning (Bengio, Courville, and Vincent, 2012): they are helping transform input data into a new form which is meaningful for the final layers. #ds/ml/featureeng 

---
# Examples:
- [[Foundation Models]] like [[Large Language Models]]
- [[Convolutional Neural Networks]]

----
# Source:
Bishop Deep Learning

(LeCun, Bengio, and Hinton, 2015)
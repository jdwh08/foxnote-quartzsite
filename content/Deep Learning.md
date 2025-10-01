---
aliases:
tags:
  - ds/ml/nn
edited: 2025-09-03T20:39
created: 2024-03-19T22:06
---
# Definition:
A type of [[Artificial Neural Network|Neural Network]] which expands on [[Perceptron|Multilayer Perceptrons]] by effectively using more than two layers.

---
# Notes:
For training, requires massively linked GPUs with huge datasets and scale. 
Generally outperforms other approaches when given enough data and compute: [[The Bitter Lesson (Machine Learning)]].

### What Makes this Deep?
- Having multiple layers (i.e., beyond 3) in your neural network.
- Deep learning is a composition of many nonlinear transformations (each in a layer). Done as a [[Directed Acyclic Graph]].
	- We hope that intermediate layers act as intermediate feature representations (e.g., phrases from tokens, edges from pixels, etc.)
	- If this goes well, we can even have a different ML algorithm act as the final layer!
	- Gradient descent starts from random initialization into features.
- Process is end-to-end, i.e., we directly go from input to output and have intermediate neurons learn feature extraction.
	- No more Hand Engineering! [[The Bitter Lesson (Machine Learning)]].
- Representation is distributed across neurons rather than being in one neuron.
	- Rather than a [[One-Hot Encoding]] like setup, instead we have neurons represent common attributes which can be combined together.
		- E.g., Vertical / Horizontal / Rectangle / Oval instead of Vertical Oval, Horizontal Rectangle, etc.

### Architecture
#### Wide vs Deep
- While Wide ANNs can theoretically learn functions [[Universal Approximation Theorem]], in practice deep ANNs are more efficient.
- Montufar et al 2014: Number of linear regions with [[ReLU]] is $O( {n \choose d}^{d(l-1)} n^d)$
- Liang, Srikant 2016: Given some $\epsilon$ target and [[ReLU]] activation functions: 
	- Wide networks need $\Omega(\text{poly}(1/\epsilon)))$ neurons as a lower bound. 
	- Deep networks require $O(\text{poly} \log (1/\epsilon))$) neurons as a lower bound if we grow depth based on $1/\epsilon$.
	- If we use ReLU, we can treat each neuron as dividing the space both as a linear separator AND when the value(s) hit zero. 
	- We can see that deep neurons result in significantly more small regions forming due to the interaction from prior neuron dividing lines.
	- The number of regions grows quickly with respect to hidden layer dimension $D$ and number of layers $L$. Larger input space $I$ does mean fewer divisions.
	- The bit with $(D^2 + D + 2)/2$ is the number of ways to divide a space with D lines.
	- We see how the deep bit grows at best exponentially, while the shallow bit grows squared. (Note: these are upper bounds because of dead neurons, etc.)


..N_r \le \left(\frac{D}{I} +1 \right)^{D_i (L-1)} \left( (D^2 + D+2)/2\right)$

 
#### Other Architecture
1. Skip Connections - jump between layers, allowing gradient to flow.
2. Sparse connections - depending on problem type, deliberately reduce some connections. E.g., [[Convolutional Neural Network|CNN]].

### Hidden Layers Role
What are the hidden layers doing?
- Representation Learning (Bengio, Courville, and Vincent, 2012): they are helping transform input data into a new form which is meaningful for the final layers. #ds/ml/featureeng 

### Training Methods
We need some way to train the neural network (weights + architecture).
1. [[Randomized Optimization]]. Yeah, [[Genetic Algorithm]]s can work, particularly for structure!
2. [[Gradient Descent]] to make small changes to the weights to decrease loss. ***
	1. We assume small changes in weights result in small changes to loss.
	2. We iterate through to continue reducing the loss.

---
# Examples:
- [[Foundation Models]] like [[Large Language Models]]
- [[Convolutional Neural Network]]

----
# Source:
Bishop Deep Learning
[LeCun, Bengio, and Hinton, 2015]([nature14539.pdf](https://www.nature.com/articles/nature14539.pdf))

[Why Deep Learning Works Unreasonably Well](https://www.youtube.com/watch?app=desktop&v=qx7hirqgfuU) for the geometric interpretation of depth.
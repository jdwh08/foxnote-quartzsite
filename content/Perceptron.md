---
aliases:
  - Feed Forward Neural Network
  - Multilayer Perceptrons
tags:
  - ds/ml/nn
edited: 2025-02-22T15:16
created: 2024-03-19T22:06
---
# Definition:
A type of [[Artificial Neural Network]] which is the most basic example.
- Originally: one layer of computation
- [[Activation Function]] is binary to mirror biological neurons.

$$f(a)=
\begin{cases}
1,\text{ if } a \le 0 \\
0,\text{ if } a > 0
\end{cases}$$

---
# Notes:
#### Limitations:
(Minsky and Papert, 1969) analyzed properties of single  and found them limited. #todo

#### Training Algorithm:
[[Backpropagation]] using calculus on differentiable error functions.
- We take errors and run them backwards through the network from outputs to inputs in order to determine updates.
- This obtains error functions which has partial derivatives with respect to each parameter in the network.
- [[Optimizers]] like [[Stochastic Gradient Descent]] can then be used to determine our parameters. 

#### Multi-Layered Perceptron (MLP)
We can now add additional **Hidden Nodes** in the middle going between inputs and outputs, creating a Multi-layered perceptron.
- We can also add "background assumptions" via a bias, e.g., designing network structures so that connections don't exist between irrelevant things. This violates [[The Bitter Lesson (Machine Learning)]].
- In the 1990s, we found that really only the final two layers would learn useful values (except [[Convolutional Neural Networks]])
- Hand-crafted pre-processing needed to transform inputs into a more easy-to-learn space. #ds/ml/featureeng 
- Further evolves into [[Deep Learning]].

---
# Examples:
Examples

----
# Source:
Bishop Deep Learning

(Rosenblatt, 1962) invented a learning algorithm for this set so that it can classify training data in a finite number of steps.

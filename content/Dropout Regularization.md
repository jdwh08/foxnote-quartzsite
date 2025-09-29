---
aliases: 
tags:
  - ds/ml/nn
  - ds/ml/regularization
edited: 2025-09-14T12:39
created: 2024-03-19T22:06
---
# Definition:
A type of [[Regularization]], particularly for [[Artificial Neural Network|Neural Network]], where we disable some features or neurons by setting their output to zero.

---
# Notes:

### Rationale
Suppose we have some features which are strongly related to the goal, but do not generalize well.
- If we do not shut these off, the model will get dependent on them and also fail to generalize!

We can also think about this as training $2^n$ different configurations of smaller neural networks, which we combine together like an [[Ensemble (Machine Learning)]].
- This reminds me specifically of [[Random Forests]], where we train a tree on a subset of features.

### Algorithm
- For some $p$ probability, we will disable any given feature or neuron.
- During inference time, all weights are turned on! 
	- Thus, we need to adjust the dimension of [[Fan In]] accordingly since we trained assuming only $np$ neurons out of $n$.
	- We scale weights by $1/p$ at training time (or scale by $p$ at inference time).

### Equivalence
- Acts like scaling features by the inverse [[Fisher Information Matrix]], then applying [[Ridge Regularization]].
- Similar to [[Adagrad Optimizer]] in that it also divides by L2 Norm

---
# Examples:
Examples

----
# Source:
GaTech DL

[Dropout Training as Adaptive Regularization](https://arxiv.org/abs/1307.1493) (Wager, Wang, Liang 2013)
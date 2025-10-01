---
aliases:
  - Feed Forward Neural Network
tags:
  - ds/ml/nn
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:
A type of [[Artificial Neural Network]] where the [[Activation Function]] is a binary threshold value.
- Originally: one layer of computation. We get $a=\sum w_i x_i$ and 


..f(a)=
\begin{cases}
1,\text{ if } a \le 0 \\
0,\text{ if } a > 0
\end{cases}$


- Note that the pre-activation is a [[Linear Combination]], so by definition each Perceptron unit learns a dividing [[Hyperplane]] in space. 

---
# Notes:

In a **Perceptron** (oldest ANN), the activation function is some threshold which returns $\mathbb{1}(a>t)$.

#### Perceptron Function Representation
- This is still enough to compute basic things
- Any boolean function in two layers at most!
	- AND: suppose $w_1=0.5, w_2=0.5, t=0.75; x_1, x_2 \in \{0,1\}$
	- OR:  suppose $w_1=0.5, w_2=0.5, t=0.25; x_1, x_2 \in \{0,1\}$
	- NOT: suppose $w_1 = -1, t=0;\ x_1 \in \{0, 1\}$
	- AND/OR/NOT allows representing all bools with combinations.
	- XOR: we have to combine multiple boolean nets.
		- XOR is basically OR minus AND.
		- Set the weight on $x_1$ AND $x_2$ to be negative and overpower the $w_1, w_2$ positive weights.

![[_Media/Excalidraw/Perceptron_XOR.png]]

- Any bounded [[Continuous Function]] can be represented with arbitrarily small error by stitching together neurons representing each piece within one hidden layer. (Cybenko 1989, Hornik et al 1989)
- Any Arbitrary Function can be represented with at least two hidden layers (Cybenko 1989); this is the [[Universal Approximation Theorem]]**.
	- Any function can be approximated as a [[Linear Combination]] of many small local functions which are 0 except for some small region
	- Each "neuron" learns an approximate representation of that small area.
	- We "stitch them" together to form a piecewise linear-ish approximation.

#### [[Model Bias]] of the Perceptron.
- Same as [[Artificial Neural Network#Algorithm Bias]].

#### Limitations:
(Minsky and Papert, 1969) analyzed properties of single layer Perceptron and found them limited.

#### Multi-Layered Perceptron (MLP)
We can now add additional **Hidden Nodes** in the middle going between inputs and outputs, creating a Multi-layered perceptron.
- We can also add "background assumptions" via a bias, e.g., designing network structures so that connections don't exist between irrelevant things. This violates [[The Bitter Lesson (Machine Learning)]].
- In the 1990s, we found that really only the final two layers would learn useful values (except [[Convolutional Neural Network]])
- Hand-crafted pre-processing needed to transform inputs into a more easy-to-learn space. #ds/ml/featureeng 
- Further evolves into [[Deep Learning]].

#### Training a Perceptron
##### Perceptron Rule
Takes advantage of the thresholding for a perceptron to figure out how to linearly separate the $y$ values using a half-plane.

![[_Media/Excalidraw/Perceptron Rule.png|231x213]]

**If data is linearly separable, perceptron rule will find it in finite time!**
- Minsky and Papert, 1969. Also requires learning rate $\eta$ isn't too large.

- Start by setting a "bias" term (constant 1) which acts as our threshold which we learn a weight for.
- Iterate over the training data (while there is error).
	- Get the error between actual $y$ and predicted $\hat{y}$.
	- Update the weight $w_i$ by the learning rate $\eta$ times error times $x_i$.
	- $w_{i,t}=w_{i,t-1} + \eta(y-\hat{y})x_i;\ \hat{y}=(\sum w_i x_i \ge 0)$
	- $\Delta w_i = \eta (y-\hat{y}) x_i$
	- Note that we only update if our prediction $\hat{y}$ differs!
	- We also "nudge up" if $y>\hat{y}$, and "nudge down" if $y < \hat{y}$

##### [[Gradient Descent]]
Works even when the data is not linearly separable.
HOWEVER, we can no longer use perceptron style thresholding.
Instead of making a threshold, let's just predict the values so that they are as close to $y$ as possible. 

Initialize weights to be small random values.
- Random values help to help introduce variability and avoid the same local minima in different runs
- Small weights suggest less complexity and thus less overfitting.



..a=\sum w_i x_i;\ \hat{y} = \mathbb{1}(a\ge0)$


Let's use [[Mean Squared Error]].


..E(w)=1/2 \sum_{x,y \in D} (y-a)^2$




..\frac{\partial E}{\partial w_i} = \sum_{x,y \in D}(y-a)*-x_i$




..\Delta w_i = \eta (y-a)x_i$


This does NOT require data to be linearly separable, but only has guarantees at the limit.

Note that the perceptron's indicator function $\hat{y} = \mathbb{1}(a\ge0)$ is NOT DIFFERENTIABLE! Therefore, to really do the full calculus on it, we need to use a differentiable [[Activation Function]], like [[Sigmoid Function]].

###### [[Backpropagation]] for Multi-Layer Perceptron
- This is basically just the [[Chain Rule]] on steroids.
- We take errors and run them backwards through the network from outputs to inputs in order to determine updates.
- This obtains error functions which has partial derivatives with respect to each parameter in the network.
- [[Optimizer]] like [[Stochastic Gradient Descent]] can then be used to determine our parameters. 

##### Issues with Weights
There are many [[Local Optima]] in the error function which we can get stuck on. This means that there are many different methods for optimizing the weights:
- Momentum term
- Higher order derivatives beyond the
- Randomized Optimization
- Penalty for "complexity" to avoid [[Overfitting]], e.g., avoid more nodes, more layers, or very large weights.

---
# Examples:
Examples

----
# Source:
Bishop Deep Learning

(Rosenblatt, 1962) invented a learning algorithm for this set so that it can classify training data in a finite number of steps.

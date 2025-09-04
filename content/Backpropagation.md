---
aliases:
tags:
  - ds/ml/nn
edited: 2025-09-03T20:13
created: 2024-04-11T18:34
---
# Definition:
A method of learning the weights of a multi-layer [[Artificial Neural Network|Neural Network]]. 

Learning representations by back-propagating errors. (Rumelhart et al 1986)
[[Perceptron#Multi-Layered Perceptron (MLP)|Multilayer Perceptrons]] can learn effectively using backprop.

----
# Notes
#### Assumptions
1. Network has a fixed structure, a directed [[Graph]] (can have cycles).
	1. Most common are [[Directed Acyclic Graph]] though.
2. Learning is the same as optimizing the weights for each edge.

$$f(x_1, x_2) = \ln(x_1) + x_1 x_2 - \sin(x_2)$$

![[Backprop NN Graph.excalidraw.png.png]]

#### Pseudocode
```pseudocode
Start with ANN with n_i inputs, n_h hidden, and n_o outputs.
Initialize all weights to be small random.

WHILE 
	- FOR data (x, y)
		- FORWARD PASS: Send input data x through network.
		- Compute outputs for every neuron

		- BACKWARD PASS: Calculate error term d
		- Output d = o*(1-o)*(y-o)
			- o is output of output layer
			- Note that o*(1-o) is from sigmoid derivative
		- Hidden d = h*(1-h)*(sum(w*d)) [sum over inputs]
			- h is output of hidden layer
			- w is weight, how "responsible" hidden is
			- d is deltas from future layer

		- NUDGE: Get nudge amount as
			- learning rate * d * x
		- UPDATE: Add nudge to existing weight for update
```

This is similar to the methods in [[Gradient Descent]]. However, the update $\delta$ calculates the contribution of the error from all the neurons in the next layer, instead of using $y-wx$ or $y-\hat{y}$ like in [[Perceptron#Training a Perceptron|Perceptron Rule]].

We have some danger in [[Overfitting]] if we just minimize training error.

#### [[ML Algorithm Bias]]
- Our **representation bias** is all possible combinations of the weights.
	- Continuous and differentiable
- Our **preference bias** generally is to interpolate smoothly between data points.
	- Hidden layers in a multi-layer perceptron often help determine useful intermediate representations to better learn the data.

#### Backprop from Scratch:
1. Suppose we want to find some relationship between $x$ and $y$. 
	1. Assume this must be smooth and a polynomial of degree 5, i.e., $y(x) = k_0 + k_1 x + k_2 x^2 + k_3 x^3 + k_4 x^4 + k_5 x^5$.
	2. We want to find the values $k_0 ... k_5$ that finds the "best" curve.
	3. To get the best curve, we need to define some measurement of quality as the [[Loss Function]]. A classical one is [[Mean Squared Error]].
	4. For our case, loss is a function of the parameters $k_0 ... k_5$. $\mathcal{L}(k_0...k_5)$. We can get the best values of $k$ by minimizing the loss function.
2. Let's build a machine that goes from values $k_0 ... k_5$ to function $\hat{y}(x)$ to loss $\mathcal{L}$.
	1. Randomize the initial weights of $k_0...k_5$.
	2. Nudge the weight $k_1$ in a direction and see what happens to loss. If loss decreases, keep it; otherwise, change a different $k$ value.
	3. This approach is called **Random [[Perturbation]]** (perturbation: minor change in a system), because we are setting values of $k$ blindly.
	4. If the system is a complete Black Box, then this is the best we can do. However, we can do better for [[Differentiable Function]].
3. Let's do better than random perturbation by using differentiability.
	1. Ideally, we'd like to know in what direction, and how much, to change each value of $k_0 ... k_5$, in order to reduce the loss.
	2. Let's start by freezing everything but $k_1$. This new loss function is $\mathcal{L}(k_1)$ which is one-dimensional. We can now get the loss at the current value of $k_1$, and take a [[Partial Derivative]]. 
	3. At each step $t$, we can take a small step in the direction that reduces the loss function based on the derivative. (i.e., + when loss function's 1st derivative is -, and - when derivative is +)
	4. We can actually do this for all values $k_0 ... k_5$ based on the gradient of the loss function: $\nabla \mathcal{L} = \begin{bmatrix} \frac{\partial \mathcal{L}}{\partial k_0} \\ \frac{\partial \mathcal{L}}{\partial k_1} \\ \vdots \end{bmatrix}$  which is a vector that points in the direction of loss. This is [[Gradient Descent]].
	5. In our case, the loss function is technically a hypersurface in 6D, but the vector still points in the direction that maximizes loss. We can still take iterative steps in the opposite direction.
4. How do we find the derivative of the loss function for complex functions?
	1. Start with building blocks which have known derivatives (e.g., powers, exponentials, log). 
	2. Combine derivatives together using the [[Derivative Rules]]: addition, multiplication rule, [[Chain Rule]]
		1. We can decompose $\frac{d}{dx} f(g(x))$ into its two simpler functions $f, g$.
		2. $g(x)$ and derivative $g'(x)$; while $f(g(x))$ has derivative $f'(g(x))$.
		3. Consider value $x$, and what happens when you nudge it by $\Delta$: $g(x) \rightarrow g(x) + g'(x)\Delta$ , so now the final output is $f(g(x)) \rightarrow f(g(x)) + f'(g(x)) * g'(x)\Delta$. 
		4. Thus, we get the chain rule: $\frac{d}{dx} f(g(x)) = f'(g(x)) * g'(x)$.
5. How do we use this to find the best curve?
	1. For each parameter $k$, write down its effect on the loss function $\mathcal{L}$ as a sequence of simple differentiable operations: $f_N(... (f_1(k)))$.
	2. Consider the first data point, $x_1$: $\hat{y_1} = k_0 + k_1 x_1 + ... + k_5 x^5$.
	3. Loss for the first data point is $(\hat{y}_1 - y_1)^2$ . (Total loss is sum for all points.)
	4. Finding the loss given data and parameters $k$ is the **FORWARD STEP**.
	5. Now, we run through this sequence of functions backwards, as the **BACKWARDS STEP**. We can work backwards because each function is a simple differentiable function, so we can use the [[Chain Rule]] from #4.
		1. When we have sums $a+b \rightarrow ... \rightarrow \mathcal{L}$, we get that $\frac{\partial \mathcal{L}}{\partial a} = \frac{\partial \mathcal{L}}{\partial a+b} \frac{\partial (a+b)}{\partial a}=\frac{\partial \mathcal{L}}{\partial a+b}$. In other words, sums propagate.
		2. When we have products $ab \rightarrow \mathcal{L}$, we get that $\frac{\partial \mathcal{L}}{\partial a} = \frac{\partial \mathcal{L}}{\partial ab} \frac{\partial (ab)}{\partial a}=\frac{\partial \mathcal{L}}{\partial ab}*b$. In other words, products distribute effects across.
		3. Powers give scaling $a^k \rightarrow ka^{k-1} \frac{\partial \mathcal{L}}{\partial a^k}$.
		4. Exponentials give exponentials $e^a \rightarrow e^a \frac{\partial \mathcal{L}}{\partial e^a}$.
		5. Logs give reciprocals $\log a \rightarrow 1/a \frac{\partial \mathcal{L}}{\partial \log a}$.
		6. When a node is used in multiple branches of a graph, the node $a$ gives two branches of effect on $\mathcal{L}$, so you add both gradients together.
	6. We can thus sequentially work backwards through the computational graph to get the backprops.
6. The final backpropagation algorithm is thus like this:
	1. **FORWARD PASS!**
	2. **BACKWARD PASS!**
	3. **NUDGE $K$!**
	4. **REPEAT!**

#### Why No Local Optima Issues?
- For small number of parameters, we can sometimes follow the gradient until we reach a local optima, and get stuck there.
- As our model size gets larger, e.g., [[Deep Learning]], we increasingly find that points are [[Saddle Points]]
- **FOR US TO GET STUCK IN LOCAL MINIMA, WE NEED EVERY SINGLE PARAMETER TO BE IN A LOCAL MINIMA.** Otherwise, we'll be able to move the other weights to escape.

#### Modifications and Improvements to Backprop
###### Momentum
We could make update based partially on the prior update size:
$$\Delta w_{@t}= \eta \delta x + \alpha w_{@t-1}$$
(adding the $\alpha w$ momentum term) allowing us to keep moving past local optima and speed convergence.

###### Editing the Loss Function
- To avoid overfitting, we can penalize the weights $w$ similar to in [[Ridge Regularization]].
- We could also consider higher order optimization, e.g., for the gradient.
- We can use alternative loss functions like minimizing [[Cross Entropy]].

#### Computation with [[Automatic Differentiation]]
1. Input is our data and parameters
2. Output is our final loss
3. Scheduling is a [[Topological Sort]] over the [[Directed Acyclic Graph|DAG]] representation of the functions.

Practical Effects:
**The flow of gradients is vital to making backprop work!**
If the gradient flow cannot be computed, or is too small, then learning doesn't happen well.

- Sum: distributes the gradient backwards to all summed values. (Negative if subtraction).
- Product: multiplies gradient by the value of the other term. $d/dx(\delta wx) \rightarrow \delta w$
- Max/Min: selects only one path (max, min) to flow down.

---
# Examples:

#### [[Logistic Regression]]
- Input: $x \in \mathbb{R}^n$
- Output: $y \in \{-1,1\}^n$
- Parameters: $w \in \mathbb{R}^n$
- Model Form: $\hat{y} = p(y=1 | x) = \frac{1}{1+e^{-w^T x}}$ ([[Sigmoid Function]])
- Loss: [[Cross Entropy]] with [[Ridge Regularization]]: $-\log(\hat{y}) + \frac{1}{2} \lambda ||w||_2^2$

Our compute graph is: $w^T x \rightarrow_u \sigma(u) \rightarrow_p -\log(p) \rightarrow_L$

We can take [[Partial Derivative]]:
- $\frac{\partial L}{\partial p} = -1/p$
- $\frac{\partial p}{\partial u} = \sigma(u)(1-\sigma(u))$ 
- $\frac{\partial u}{\partial w} = x$
Finally, we can combine:
- $\frac{\partial L}{\partial u} = -1/p * \sigma(u)(1-\sigma(u))$
- $\frac{\partial L}{\partial w} = -1/p * \sigma(u)(1-\sigma(u))*x$
	- $-\frac{1}{\sigma(w^T x)} * \sigma(w^T x)(1-\sigma(w^T x)) * x$
	- $-(1-\sigma(w^T x))x$

NOTE: this is easy relatively speaking because the [[Logistic Function]] goes from $\mathbb{R}^N \rightarrow \mathbb{R}^1$, so everything afterwards is just a scalar. No matrix multiplication.

---
### Sources:
- [Backpropagation from Scratch](https://www.youtube.com/watch?v=SmZmBKc7Lrs)
- (Rumelhart, Hinton, and Williams, 1986)
- Mitchell 1997
- [Why don't we get stuck in local optima?](https://www.youtube.com/watch?v=NrO20Jb-hy0) 
- GaTech DL

---
aliases: 
tags:
  - ds/ml/nn
edited: 2025-02-15T16:35
created: 2024-04-11T18:34
---
### Definition:
Definition


----
### Backprop from Scratch:

1. Suppose we want to find some relationship between $x$ and $y$. 
	1. Assume this must be smooth and a polynomial of degree 5, i.e., $y(x) = k_0 + k_1 x + k_2 x^2 + k_3 x^3 + k_4 x^4 + k_5 x^5$.
	2. We want to find the values $k_0 ... k_5$ that finds the "best" curve.
	3. To get the best curve, we need to define some measurement of quality as the [[Loss function]]. A classical one is [[Least Squares]] with square error.
	4. For our case, loss is a function of the parameters $k_0 ... k_5$. $\mathcal{L}(k_0...k_5)$. We can get the best values of $k$ by minimizing the loss function.
2. Let's build a machine that goes from values $k_0 ... k_5$ to function $\hat{y}(x)$ to loss $\mathcal{L}$.
	1. Randomize the initial weights of $k_0...k_5$.
	2. Nudge the weight $k_1$ in a direction and see what happens to loss. If loss decreases, keep it; otherwise, change a different $k$ value.
	3. This approach is called **Random Perturbation** (perturbation: minor change in a system), because we are setting values of $k$ blindly.
	4. If the system is a complete Black Box, then this is the best we can do. However, we can do better for [[Differentiable Functions]].
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

---
### Notes:
Learning representations by back-propagating errors (Rumelhart et al 1986): [[Multilayer Perceptrons]] can learn effectively using backprop.

---
### Examples:
Examples

---
### Sources:
Backprop from scratch is built on https://www.youtube.com/watch?v=SmZmBKc7Lrs.

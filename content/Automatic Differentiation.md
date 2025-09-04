---
aliases:
tags:
  - cs/dsa/array/matrix
  - math/calculus/derivative
  - ds/ml/nn
edited: 2025-08-31T18:39
created: 2024-03-19T22:06
---
# Definition:
A method of performing [[Derivative]] for [[Backpropagation]] of [[Artificial Neural Network|Neural Network]]s.
- Creating a [[Directed Acyclic Graph|DAG]] computation graph
- Traverse the graph with individual derivatives at each node and the [[Chain Rule]].

---
# Notes:
### Algorithm
1. Input is our data and parameters
2. Output is our final loss
3. Scheduling is a [[Topological Sort]] over the [[Directed Acyclic Graph|DAG]] representation of the functions.

Automatic Differentiation is the algorithm family that does this. This is basically using the same approach as in [[Chain Rule]] for matrix calculus.

#### Reverse Mode Automatic Differentiation
1. Do the forward pass and store intermediate values for use later.
2. Assign intermediate variables to parts of the chain.
3. Start at the end (loss)
4. Take partial derivatives based on the inputs
	1. If multiple input paths, sum across them
5. Continue working backwards.

This is useful for networks which are [[Fan In]], i.e., a large number of inputs goes to a small number of outputs.
 - We only need to do the vector gradient from a small number of outputs!
 
This is the standard setup for most neural networks.
- We start from [[Loss Function]] [[Gradient]] (a scalar) and work our way backwards.
 - Essentially, the final loss layer acts as a [[Fan In]], i.e., many inputs go into few outputs.

#### Forward Mode Automatic Differentiation
1. Get the prior layer gradients $\partial / \partial x_{i-1}$, or $1$ if we are at the starting input
2. Use the [[Chain Rule]] to calculate the current gradients $\partial / \partial x_i$ based on prior
3. Pass on the current gradients to the next layer.

This is useful for layers which are [[Fan Out]], i.e., a small number of inputs goes to a large number of outputs.
- We only need to do the vector gradient for a small number of inputs!

### [[Big O]] Analysis
Practically speaking, both approaches have the same time and space complexity.

### Alternatives:
1. [[Numerical Differentiation]] - this uses the definition of the [[Derivative]] as $\frac{f(w+\delta)-f(w)}{\delta}$ to numerically calculate values.

---
# Examples:

### Forward Mode
Suppose we have some output $h(x)$, so the DAG compute chain is $x \rightarrow g(x) \rightarrow_z h(z)$.

We can compute $\dot{z} = \frac{\partial z}{\partial x} = \frac{\partial z}{\partial x} \times \frac{\partial x}{\partial x}$, and $\dot{h} = \frac{\partial h}{\partial z} \times \dot{z}$
Notice how we compute gradients from the starting values $x$ and move forward.

### Backward Mode.
Suppose we have some output $h(x)$, so the DAG compute chain is $x \rightarrow g(x) \rightarrow_z h(z)$.

We first start by computing the "upstream gradient" of $\frac{\partial h}{\partial z}$.
We saved the local gradient $\frac{\partial g}{\partial x}$, which we use to multiply.
We then pass this $\frac{\partial h}{\partial x}$ on to the prior layers as the "downstream gradient".

### A Basic Neuron in a [[Artificial Neural Network|Neural Network]].
Suppose we have a single neuron $f = w x + b$.

Compute chain becomes $x \rightarrow wx \rightarrow_z +b \rightarrow_a f$

In **Forward Mode** for $w$:
- $\partial w / \partial w$ is start
- We then get $\partial z / \partial w = \partial w / \partial w \times \partial z / \partial w$
- We then get $\partial a / \partial w = \partial z / \partial w * \partial a / \partial z$
- This is the same as $\partial f / \partial w$ so we are done! 

(if we wanted $b$, then we'd start with $\partial b / \partial b$ and go from there to $a$)

In **Backwards Mode** for $w$:
- $\partial f / \partial f$ is start
- $\partial f / \partial a = \partial f / \partial f * \partial f / \partial a$ (saved)
- $\partial f / \partial z = \partial f / \partial a * \partial a / \partial z$
	- Or $\partial f / \partial b = \partial f / \partial a * \partial a / \partial b$ if we want for $b$
- $\partial f / \partial w = \partial f / \partial z * \partial z / \partial w$

### More Complicated Computation Graph
- $f_1(w_1, w_2) = e^{e^{w_1} + e^{2w_2}} + \sigma(e^{w_1} + e^{2w_2})$
- $f_2(w_1, w_2) = w_1 w_2 + \max(w_1, w_2)$

|       |                 |               |                   |                   |               |
| ----- | --------------- | ------------- | ----------------- | ----------------- | ------------- |
| $w_1$ | $e^{w_1} = a_1$ |               |                   | $e^{a_3} = a_4$   |               |
|       |                 |               | $a_1 + b_2 = a_3$ |                   | $a_4+a_5=f_1$ |
| $w_2$ | $2w_2 = b_1$    | $e^{b_1}=b_2$ |                   | $\sigma(a_3)=a_5$ |               |

|       |                      |                   |
| ----- | -------------------- | ----------------- |
| $w_1$ | $w_1 w_2 = c_1$      |                   |
|       |                      | $c_1 + c_2 = f_2$ |
| $w_2$ | $\max(w_1, w_2)=c_2$ |                   |

----
# Source:
Source
---
created: 2024-03-19T22:06
edited: 2025-09-27T19:39
aliases:
tags:
  - ds/ml/nn/theory
---
# Definition:
A large enough [[Artificial Neural Network|Neural Network]] can theoretically represent any function.

---
# Notes:

### Formal
- Any bounded [[Continuous Function]] can be represented with arbitrarily small error by stitching together neurons representing each piece within one hidden layer. (Cybenko 1989, Hornik et al 1989)
- Any Arbitrary Function can be represented with at least two hidden layers (Cybenko 1989); this is the UAT.
	- Linear Output
	- "Squashing [[Activation Function]]" like [[Sigmoid Function]].
	- Approximates any "[[Borel Measure]]" function between finite-dimensional spaces within some $\epsilon$ error
		- "Continuous, closed and bounded, $\mathbb{R}^n$"
	- Derivatives of the network approximate the derivatives of the function well.

### Intuition
 - Any function can be approximated as a [[Linear Combination]] of many small local functions which are 0 except for some small region.
- Each "neuron" learns an approximate representation of that small area.
- We "stitch them" together to form a piecewise linear-ish approximation.

### Issues
- UAT does NOT mean that ANNs can learn anything.
- Instead, it says that an ANN has the potential capacity to represent things.
- We do NOT have guarantees about...
	- The number of neurons required
		- (Barron 1993) says for single layer, could be exponential!
	- Whether a solution can be found.
		- We could have a potentially bad initialization with [[Local Optima]] trap?
	- How many restarts are required to find a good solution.

Thus, while UAT discusses wide NNs, today's ANNs are focused around [[Deep Learning]].

### Depth Variants
- Some functions are known to need much fewer neurons if we do not constrain depth.
- (Montufar et al 2014): [[Deep Learning]] networks with [[ReLU]] represent linear regions which grow exponentially with depth.
	- Think of this like learning some split-lines in space. 

---
# Examples:
Examples

----
# Source:
(Hornik 1989), (Cybenko 1989) for the originals.
Mitchell Machine Learning
Goodfellow Deep Learning

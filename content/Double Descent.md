---
aliases:
  - Lottery Ticket Hypothesis
tags:
  - ds/ml/nn
edited: 2025-08-24T18:55
created: 2024-03-19T22:06
---
# Question:

Why do large [[Artificial Neural Network|Neural Network]]s not [[Overfitting|Overfit]] their training data, even when they have zero error on the training dataset?

**More formally:**
If you continue to train the neural network beyond the point where there is clear overfitting, we actually see out-of-sample performance drop once again! This is called **Double Descent**. Why?

(this also applies to [[Maximal Margin Classifiers]] and [[Support Vector Machines|SVM]]s)

----
# Answer:

### The Spline Explanation (ISL)
1. [[Bias-Variance Trade Off]] happens because we perfectly match ("interpolate") the training data and thus get zero training error, resulting in poor fits to test data.
2. In certain settings, interpolation can actually perform better!
	1. Suppose we fit [[Splines]] to the data with increasing degrees of freedom.
	2. At a small degree of freedom, we get reasonable estimates.
	3. At medium degrees of freedom (e.g., where $df = n$), we arrive at zero error on the training set.
		1. NOTE: There is only one way to fit $df=n$. This often includes huge spikes up and down, and is thus terrible.
		2. **Notice how in this case, $df$ is not actually a good metric for "freedom"? If $df=n$, we are pinned to only one solution.**
	4. At large degrees of freedom $df >> n$, there are now infinite ways to perfectly fit the training data.
		1. We can pick the one which is smoothest.
		2. If the data are all close together, and the observations aren't too far away, we can do okay.
3. [[Stochastic Gradient Descent]] likes picking "smooth" options.
4. This only can work if the training data has high signal-to-noise; otherwise, [[Regularization]] and not having perfect training error is almost certainly better.

### The Lottery Ticket Hypothesis (for [[Convolutional Neural Network|CNN]])
1. Consider a large [[Artificial Neural Network|Neural Network]]. Randomize the initial states.
2. Each subset of the large neural network can be thought of as a small neural network with random starting weights. (i.e., a "lottery ticket").
	1. As neural networks increase, the number of sub-networks increase exponentially
3. Training a neural network with [[Gradient Descent]] essentially trains all of these smaller neural networks simultaneously. 
4. Most of these subnetworks have terrible initial weights (bad lottery tickets).
5. As long as one has a good initialization, it will eventually learn the task by itself (winning lottery ticket).
6. Huge networks create huge pools of initializations, allowing us to luck into rarer smaller networks that perform and generalize well.
7. The larger the neural network, the more likely we are to find a small and good generalizer from initial weights.

---
# Notes:
Notes

---
# Examples:
Examples

----
# Source:

ISL Python

https://www.youtube.com/watch?v=UKcWu1l_UNw

[Reconciling modern machine learning practice and the bias-variance trade-off](https://arxiv.org/abs/1812.11118)
- Train neural networks of larger and larger sizes
- Plot the train and test error as a function of neurons per layer
- Continue **beyond the point where there is zero training error**!
- Past a certain point, we actually start seeing **test error decrease again, continuously, and beyond the first drop, without limit**
- "Double descent": Scale up the neural network.

[The Lottery Ticket Hypothesis: Finding Sparse, Trainable Neural Networks](https://arxiv.org/abs/1803.03635)
- Start with a neural network with random initialization
- Remove the 10\% of weights which are close to zero (i.e., should have low impact)
- Retrain the neural network with the same random initialization
- Repeat 30 times.
- The final network is 4\% of the initial, and has the same test error as the full network
- This is the sub-network that is actually doing real work.
- We found the "lottery ticket" randomization that produces the best results!

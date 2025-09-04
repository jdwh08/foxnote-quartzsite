---
aliases:
tags:
  - stats
  - ds/ml/regularization
edited: 2025-09-03T22:09
created: 2024-03-19T22:06
---
# Definition:
Methods to help generalize [[Machine Learning]]. 
Avoid [[Overfitting]] by reducing general error (without reducing training error).

---
# Notes:

This is also impacted by the [[No Free Lunch Theorem]], i.e., there is no universally best regularization method either.

### [[Bayesian Learning]] Perspective
- When taking [[Maximum A Posteriori Estimation]], we can think of the regularization penalty sometimes like the [[Prior and Posterior Probabilities|Prior Distribution]] log-p-theta bit in $\arg \max \log p(x | \theta) + \log p(\theta)$

### Parameter [[Norm]] Penalties
Add some **penalty** for complexity into the [[Loss Function]]:
$$\tilde{L}(\theta; X; y) = L(\theta; X; y) + \lambda \Omega(\theta)$$
- [[Lasso Regularization]] $+\lambda ||w||_1 \rightarrow \nabla \lambda + \text{sign}(w)$
	- Approximating via [[Taylor Series]], $H(w-w*)$ and assuming it is [[Diagonal Matrix]] gives that our new $w$ is roughly $\text{sign}(w) \max(|w_i|-\lambda / H_{i,i}, 0)$.
	- This is either 0 if our $w$ is too small OR gets shrunken a little bit.
	- I.e., our stuff is sparse. Good for [[Feature Selection]].
- [[Ridge Regularization]]: $+\lambda w^T w \rightarrow \nabla + \lambda w$
	- Effectively "shrinks" our weights $w$ along the [[Eigenvectors and Eigenvalues|eigenvectors]] of the [[Hessian]] of the [[Gradient]] $J=L$ here if using quadratic approximation $L=J=J(w*)+1/2(w-w*)^T H(w-w*)$ (this is basically [[Newton-Raphson]])
- [[Elastic Net Regularization]]

NOTE: we typically do not penalize the bias / y-intercept terms. 
- These generally are generally learned accurately
- Penalizing bias creates huge [[Bias (estimator)]] and underfitting.

##### [[Matrix Pseudoinverse|Moore-Penrose Pseudoinverse]] Perspective
- If we have less data than parameters, one solution is to constrain the parameters so they are learnable.
- This is basically the same approach as in Moore-Penrose, with $A^T A + \alpha I$ where $\alpha I$ roughly corresponds to the regularization.

##### Alternative: Explicit Weight Caps
Instead of using some penalty term, we might set the bounds directly at some $k$, and then use [[Constrained Optimization]].
- Constrain the [[Norm]] of the weights of the columns (i.e., across neurons in a layer).
- We can think of optimizing these just like in Econ [[Budget Constraint]] with [[Lagrange Multipliers]] and [[KKT Conditions]].
- $\mathcal{L} = J(\theta, X, y) + \lambda (\Omega(\theta)-k)$

### Early Stopping
Often if the model is complicated enough, further training will start to increase loss on validation set. To fix this, we can stop training once val loss gets higher.
1. We can use Grid Search to find the optimal number of epochs
2. We can use stop after some threshold is reached

Note that this is essentially regularizing because we limit the possible values of the weights $w$ only to some region which could be reached within the $n$ steps.
- It turns out to be roughly equivalent to [[Ridge Regularization]]. 

### [[Bootstrap Aggregating|Bagging]] and [[Ensemble (Machine Learning)]]
- If errors have some variance $v$ and covariance $c$ then averaging a bunch of ensembles gives $(1/k) v + ((k-1)/k) c$.
- Independent errors (e.g., if covariance 0) reduce the overall error rate by having them partially "cancel out"

### Dropout


### Synthetic Data
Generate synthetic data and use that to augment our learner in [[Classification]] problems.
- Transform the data while ensuring it has the same output type. E.g., add noise, do limited transformations, etc.
- Especially useful for object detection, speech, etc.

##### Add Noise
- To Input Data (acts similarly to regularization of weights)
- To Weights (for [[Recurrent Neural Network|RNN]]), kinda like adding uncertainty for Bayesian
- To Labels. 
	- We use **Label Smoothing** with [[Softmax]] and predict $1-\epsilon$ for probability label is correct, and $\epsilon / (c-1)$ spreading incorrect probability evenly.

#### Parameter Tying and Sharing
- Connect the weights together of two optimizations.

[[Convolutional Neural Network|CNN]]
- Share parameters across multiple locations in the input image

[[Semi-Supervised Machine Learning]]
- Connect our supervised model $P(y|x)$ with the weights of the unsupervised model $P(x)$
- Tradeoff between supervised and unsupervised importance 

[[Sentence Transformers]]
- Siamese BERT models use the same weights and [[Triplet Loss Function]] to ensure 

#### Multi-Task Learning


---
# Examples:


----
# Source:
Goodfellow Deep Learning
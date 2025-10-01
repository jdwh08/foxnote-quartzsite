---
aliases:
tags:
  - ds/ml
edited: 2025-09-30T17:45
created: 2024-03-19T22:06
---
# Definition:
A type of [[Boosting]] which *directly* predicts the [[Residuals]] or errors from prior models for its boosting.

---
# Notes:

#### Training Algorithm for [[Regression]]:
1. Calculate the initial guess as the mean: $\bar{y}$.
2. Determine the [[Residuals|pseudo-residuals]] for the prediction.
3. While we have not met a [[Stopping (machine learning)]]:
	1. Build a new tree which predicts the pseudo-residuals.
	2. Scale the new tree by some [[Learning Rate]] $\lambda$ to prevent us from [[Overfitting]] immediately.
	3. Combine the new tree with the prior initial guess and tree(s).
		1. $F_{t+1}=F_{t}+\lambda f_t(x)$
	4. Update our prediction target to the new pseudo-residuals: $y_{t+1} = y_{t} - \lambda * f_t(x)$
##### Key Parameters:
1. Number of trees $T$. Can [[Overfitting|Overfit]] if too large.
2. [[Learning Rate]] $\lambda$, typically $0.01$ or $0.001$
3. Depth / number of splits in each tree $d \ge 1$

#### Training Algorithm for Classification:
1. We predict the log [[Odds]] as our initial prediction. 
	1. Convert to probability using [[Logistic Function]].
2. Determine the psuedo-residuals.
3. 3. While we have not met a [[Stopping (machine learning)]]:
	1. Build a new tree which predicts the pseudo-residuals.
	2. We need some way to go between the residuals (in probability space) and the predictions (in log-odds space).
		1. We typically use $\frac{\sum r}{\sum p_{t-1,\ i} * (1-p_{t-1,\ i})}$, where $p_{t-1,\ i}$ is the prediction for $i$ from the previous tree $t$.
	3. Combine the new tree with the prior initial guess and tree(s).
		1. $F_{t+1}=F_{t}+\lambda f_t(x)$
	4. Get the new pseudo-residuals using [[Logistic Function]] for probability.
	5. Update our prediction target to the new pseudo-residuals: $y_{t+1} = y_{t} - \lambda * f_t(x)$

#### Why it Works:
- Taking small steps with $\lambda$ towards predicting residuals slowly approximates [[Gradient Descent]].

#### Difference to [[AdaBoost]]:
- Start with an initial guess (e.g., average value)
- Use larger trees  (max leaves of 8-32 instead of just 2).
- Trees are scaled by the **same amount**.

---
# Examples:

#### Math Derivation for Regression
4. [[Loss Function]]: $L(y, f(x))=1/2 (y_i - f({y}_i))^2$. This is 1/2 of the squared [[Residuals]]. 
	1. This is nice because $\frac{\partial L}{\partial f} = -\left(y_i - f(y_i)\right)$, or the negative [[Residuals]].
5. Get initial guess $f_0(x) = \underset{\gamma}{\arg\min} \sum_i^N L(y, \gamma)$, i.e., find the $\gamma$ predicted value that minimizes loss.
	1. $\sum_i^N \frac{\partial L}{\partial f} = -\sum_i^N \left(y_i - f(y_i)\right) = 0$
	2. $\rightarrow N * f(y) = \sum_i^N y_i \rightarrow \bar{y}$
	3. This is the [[Sample Mean]].
6. Make a tree $m \in M$: 
	1. Compute $r_{im} = -\frac{\partial L(y_i, F(x_i))}{\partial F(x_i)}|_{F(x)=F_{m-1}(x)} \forall i \in N$
	2. This is just the same as the actual [[Residuals]] for $i$ in tree $m$ in our case.
	3. Fit a [[Decision Trees|tree]] $m$ to build our regions $R_{jm}$ indexed by $j$.
	4. Calculate the output values for the region $\gamma_{jm} = \underset{\gamma}{\arg\min} \sum_{x_i \in R_{ij}} L(y_i, F_{m-1}(x_i) + \gamma)$
		1. We restrict data to only the region $R_{jm}$.
		2. We use the prior model $F_{m-1}(x_i)$ as our $\hat{y}_i$.
		3. $\frac{\partial L}{\partial \gamma} = \sum_i -(y_i - F_{m-1}(x_i) - \gamma) = 0$
		4. $\rightarrow \gamma = 1/{|R_{ij}|} \times \sum_i (y_i - F_{m-1}(x_i))$ which is just the [[Sample Mean]] of the residuals in the region $R_{jm}$.
7. Update our model for the new tree:
	1.  $F_m(x)=F_{m-1}(x) + \lambda \sum_{j}^{J_m} \gamma_{im} * \mathbb{1}(x \in R_{jm})$
	2. That sum is there in case a single sample is in multiple [[Leaf Node]]s.
	3. Get new predictions.
8. Output the final $F_M(x)$ once we hit our [[Stopping (machine learning)]].

----
# Source:
Invented by Jerome Friedman.
ISL Python
ESL

---
aliases:
  - KNN
tags:
  - ds/ml/instance/knn
edited: 2025-09-28T22:54
created: 2024-03-19T22:06
---
# Definition:
[[Instance Based Learning]] system which predicts values by looking at the closest $k$ values to the existing point.

Formally, given some value $K$ and prediction point $x_0$, we identify the $K$ observations closest to $x_0$ (hence $\mathcal{N}_0$), and then for [[Regression]] estimate 

..f(x_0)=\frac{1}{K} \sum_{x_i \in \mathcal{N}_0} ^ K y_i$


(or, for [[Classification]], estimate with the mode.)

---
# Notes:

### Intuition
We might assume that data which is "near by" is representative.
### Algorithm
```psuedocode
Training Data D = {x_i, y_i}, ...
Distance metric d(x_i, X)
Number of Neighbours K

Add training data to examples.

NN = {i: d(x_i, X); pick k smallest}

Return: 
- Some transformation; typical choices:
- mean(NN_y) for regression
- mode(NN_y) for classification
```

Note: we can also weight the value(s) by distance.
- $w_j = \frac{1}{d(x_i, x_j)^2}$

For ties, we can dump them all in...

##### [[Big O]]
Assuming the data is pre-sorted (which takes $\log(N)$, ...)

|                            | Training Time                                                                                                                                                              | Inference Time                                                                     | Training Space                    | Inference Space |
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- | --------------------------------- | --------------- |
| 1NN                        | 1 (store as [[ArrayList\|list]])                                                                                                                                           | $\log(n)$ [[Binary Array Search]]                                                  | $N$ (save as [[ArrayList\|list]]) | 1               |
| KNN                        | 1 (store as [[ArrayList\|list]])                                                                                                                                           | $k+log(n)$ [[Binary Array Search]] followed by checking within some neighbourhood. | $N$ (save as [[ArrayList\|list]]) | 1               |
| [[Linear Regression\|OLS]] | $N$ (yes we're doing [[Matrix Inverse]] which is $O(f^3)$ but remember that this is f for each coefficient not each datapoint; we just need to go through all the points). | 1                                                                                  | 1 (scales with features not data) | 1               |

You'll note that in KNN we wait until needed (inference) to learn; thus it is a [[Lazy Algorithm]].

### Hyperparameters

#### K Neighbours
Key metric here is the value of $k$. As $k \rightarrow 1$, our model becomes more expressive but more likely to [[Overfitting|overfit]]. K controls our [[Bias-Variance Trade Off]].
- $K=1$ is perfect fit to the data.
- $K$ being large smooths out the data but introduces [[Bias (estimator)]] by smoothing over variation in the true [[Data Generating Process]].

This is different from [[Kernel Regression]] (another [[Nonparametric Statistics]] measure) because we **do not weight values based on how far away they are.**

#### Distance Metric
[[L2 Norm|Euclidean Distance]] is the typical, but other measures are...
- [[L1 Norm|Manhattan Distance]].
- Mismatch rate for classification
- [[Embeddings]] and [[Cosine Similarity]]

We can also handle **weighting** the output values based on distance.
- In the special case where $k=n$, weights can be used to find a weighted average from global values.

### Aggregation Metric

Instead of averages or modes, we could do something like a local [[Linear Regression|OLS]], called [[Locally Weighted Regression]].
- This allows us to represent things closer to piecewise linear.

### KNN Issues
1. [[Curse of Dimensionality]]: If we have few observations but a high number of features, we might not have any close neighbours.
	1. This is especially true when we have features which are not useful for predicting the values but contribute to distance.
2. Interpretability

### [[Model Bias]]
1. Locality -- points which are nearby are similar. 
	1. Based on distance function. Captures the idea of "locality".
	2. Your distance function is what encodes domain knowledge.
2. Smoothness -- by averaging, we are interpolating smoothly between points.
3. Features matter equally.

---
# Examples:
Examples

----
# Source:
Source
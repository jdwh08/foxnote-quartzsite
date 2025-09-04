---
aliases:
  - ICA
tags:
  - ds/ml/featureeng
  - ds/dimension_reduction
edited: 2025-07-26T12:07
created: 2024-03-19T22:06
---
# Definition:

A type of feature engineering which uses [[Mutual Information]] to do [[Feature Selection]].

![[Independent Components Analysis.excalidraw.png.png]]

---
# Notes:

### Algorithm
1. Assume there are "hidden variables" that are the true [[Data Generating Process]]; these are [[Independent Events|Independent]] and features are [[Linear Combination]]s of them.
	1. Recall that by the [[Central Limit Theorem (Lindeberg-Levy)|CLT]] the [[Convolution]] of [[Random Variable]] tends to become [[Normal Distribution]]. **Thus, we want to find the base hidden variables that are as non-normal as possible.**
	2. NOTE: **Hidden variables must not follow [[Normal Distribution]]**!
	3. Remember that the [[Convolution]] of [[Normal Distribution]]s is [[Normal Distribution]]. This means that we can't identify which hidden variable is which.
	4. To get a sense of how non-gaussian our data is, we can use the [[Kurtosis]], but this tends to have sensitivity issues to outliers. Thus, instead we use [[Entropy (information theory)|entropy]].
2. Convert features so that they have [[Mutual Information]] of zero between them.
	1. Note that [[Normal Distribution]] has highest possible [[Entropy (information theory)|entropy]].
3. Ensure the [[Mutual Information]] to the target labels is as high as possible.

##### FastICA
Is the practical algorithm used for independent components analysis.
- Note that it starts off with PCA! (for denoising probably.)

### Preprocessing Steps
1. Center the data so everything has zero mean, like in PCA.
2. Transform the data so that components have zero [[Correlation (Pearson)|Correlation]] and equal [[Variance]], e.g., with [[Eigenvalue Decomposition]].

### Comparison to [[Principal Component Analysis|PCA]]:
1. Features are no longer [[Orthogonal Vectors]]; instead, they are [[Independent Events]].
2. Features maximize [[Mutual Information]] (or non-Normal-ness) instead of [[Variance]] along the components.
	1. If the data is [[Normal Distribution]], then these two are the same.
	2. You can think of summing these in [[Linear Combination]] as sums of independent things, which become normal thanks to the [[Central Limit Theorem (Lindeberg-Levy)|Central Limit Theorem]].
3. Features don't really have ordering. You can try with [[Kurtosis]] I guess.
4. Use Case:
	1. **If you think the causal variables are independent**, then you shouldn't be maximizing variance! This "mixes" the features together.
	2. **ICA** assumes the variables are highly non-normally distributed.
5. **ICA** is sensitive to the [[Matrix Transpose]].
6. ICA might not always find the components if the assumptions aren't satisfied.
7. There are not any well optimized methods for computing this.

### Issues
1. True hidden variables in DGP have [[Normal Distribution]]. If yes, we can't separate them.
2. [[Normal Distribution]] in the noise as well. This makes it worse for de-noising data than [[Principal Component Analysis|PCA]].

---
# Examples:

### Cocktail Party Problem:
Suppose you have $n$ sources of noise recorded by $m$ microphones. We want to *decompose* this from the microphone audio (all mixed) back into their sources.

| Time  | 0   | 1   | 2   | ... |
| ----- | --- | --- | --- | --- |
| Mic 1 | 100 | 127 | 55  |     |
| Mic 2 | 13  | 31  | 19  |     |
| Mic 3 | 7   | 42  | 12  |     |

Each microphone is a feature. We want to convert this so that all sources are independent, but it still tells us about the labels.

[[Principal Component Analysis|PCA]] does a terrible job at this.

### Face Identification
Suppose we have a dataset of faces which we want to decompose.
ICA will find **local** features: noses, eyes, hair, etc.

### Natural Scene Images
- Edges (we can then use fast edge detectors)

### Documents in [[Information Retrieval]]:
- Topics

----
# Source:
Independent Component Analysis: Algorithms and Applications (Hyvärinen and Oja, 2000)
GaTech ML
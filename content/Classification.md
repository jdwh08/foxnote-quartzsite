---
aliases: 
tags:
  - ds/ml
edited: 2025-05-14T20:46
created: 2025-01-06T18:53
---
### Definition:
A type of [[Supervised Machine Learning|Supervised Machine Learning]] where the output space is a set of CLASSES (mutually exclusive)
- $\mathcal{Y} = \{1, 2, ..., C\}$ 
- $\mathcal{Y}={\text{True}, \text{False}}$

---
### Examples:
Binary Classification is only two classes.
Image Classification takes pixels $\mathcal{X} = \mathbb{R}^D = C \times D_1 \times D_2$
- 3 colour channels $C$, two dimensions for image.


##### Iris Dataset
Suppose we have the IRIS dataset
- 150 labelled Iris flowers, 50 of each type.
- Features are sepal length+width, petal length+width
- Tabular data, stored as Design Matrix (row is sample, col is feature)
- EDA stuff like pair plots, scatters, dimension reduction, etc.

Let's first learn a classifier basic classifier:
$f(x ; \theta) = \text{setosa if petal len < 2.45; then versicolour if petal width < 1.75 else virginica}$ This is a [[Decision Trees|Decision Tree]]. We store the parameter boundaries with $\theta$.

Now, let's get our success metrics:
**Misclassification Rate**:
$$\mathcal{L}(\theta) = \frac{1}{N} \sum_{n=1}^{N} \mathbb{I}(y_n \neq f(x_n; \theta))$$
i.e., the fraction of wrongly classified values.
- Assumes all errors are equal (no weights). A [[Loss Function]] might be used instead $\mathcal{l}(y_n, f(x_n; \theta))$
$$\mathcal{L}(\theta) = \frac{1}{N} \sum_{n=1}^{N} \mathcal{l}(y_n, f(x_n; \theta))$$

To train our classifier, we can find the value that minimizes the loss:
$$\hat{\theta} = \underset{\theta}{\arg\min} \frac{1}{N} \sum_{n=1}^N l(y_n, f(\boldsymbol{x_n}; \boldsymbol{\theta}))$$
Note that we want to be sure that it generalizes beyond just the training dataset.

----
### Source:
Probabilistic Machine Learning by Kevin P Murphy
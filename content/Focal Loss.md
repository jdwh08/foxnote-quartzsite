---
aliases: 
tags:
  - ds/ml/loss_function
edited: 2025-09-24T17:05
created: 2024-03-19T22:06
---
# Definition:
A [[Loss Function]] based on [[Log Loss]] which takes into account performance on "difficult" observations $\gamma$ along with class-weighing $\alpha$.


..\mathcal{L} = -\frac{1}{N} \sum \alpha_c (1-\hat{y}_c)^\gamma \log(\hat{y})$



---
# Notes:

### Rationale
Suppose we have a [[Classification]] task which highly sparse or imbalanced data (e.g., on the order of 1:100 or worse). 
- Very common situation, e.g., training [[Convolutional Neural Network|CNN]] or [[Vision Transformers|ViT]] on image classification
- Huge Class Imbalance means we need some way to ensure that the model learns the minority classes as well.
- Loss function is still dominated by **easy examples**, e.g., ones which are **clearly negative** or **clearly positive**.

### Derivation
1. We start with standard [[Cross Entropy|Log Loss]] $-\sum \log(\hat{y})$.
2. We add class-specific weights to handle class-imbalance: $-\alpha_c \sum \log(\hat{y}_c)$
	1. This is set either as [[Hyperparameter Tuning]] or the reciprocal of the number of samples.
3. We add a *focusing penalty term* $(1-\hat{y})^{\gamma}$ which prioritizes probabilities $\hat{y}$ which the model is not quite certain about.
	1. $\gamma$ is a hyperparameter controlling the strength
	2. $\gamma=0$ is just [[Log Loss]].
	3. $\gamma=2$ is a "reasonable value"

### Modifications
#### Effective Samples for Class Weights $\alpha$
While we can typically use these via reciprocal of count, there are better strategies.
- [Class-Balanced Loss Based on Effective Number of Samples](https://arxiv.org/abs/1901.05555) (Cui et al 2019) calculates the "effective" count of samples instead as $(1-\beta^n)/(1-\beta)$.
- Weight by the reciprocal of **effective samples**, rather than true counts!

**Assumptions**
- Suppose we have some given class $c$.
- The population has $N$ total samples. 
- The empirical [[Probability]] of sampling an observation of class $c$ already in our data $n_c$ is $p_c = n_c / N$.
- We have some existing data $n$.
- We will [[Random Sampling#Without Replacement]]

Now, let's go sample an additional piece of data. It happens to be of class $C$.
1. New data point has $p_c$ probability of being in our data for class $C$ already, and $1-p_c$ for being new to us.
2. Let $E_{n+1}$ be the number of observations in class $C$ after sampling, and $E_{n}$ be the number before sampling. Then, $E_{n+1} = p E_{n} + (1-p) (E_{n}+1)$.
	1. I.e., $p_c$ probability of already being seen, or $E_n / N$.
3. Then, $E_{n+1} = p E_n + E_n + 1 - p E_n - p = E + 1 - E_n / N = E_n((n-1)/n) + 1$

If we choose $E_n$ to be $(1-\beta^n)/(1-\beta)$, where $\beta = (N-1)/N$, then we can see that indeed $E_{n+1} = E_n$: $(1-\beta^n)/(1-\beta) \cdot \beta + (1-\beta)/(1-\beta)=(1-\beta^n)/(1-\beta)$.

Finally, we can see the base case where $E_1=1$ must be true because the first time we sample without replacement there is nothing in $E_0$ so the data MUST be new. Thus, this is true via [[Proof by Induction]]. Wow.

We can then use the weights calculated in $\alpha$ here for regular binary [[Cross Entropy]], or modify them for [[Softmax]] across classes:
- Recall softmax is $e^x / \sum(e^x)$, where $x$ here is a class.
- However, our loss is [[Log Loss]].
- The $e^x$ and $\log$ cancel out. Thus, we can get the weights for softmax as just $w/\sum(w)$

---
# Examples:

### Basic Calculation
With Binary $y$ outcomes in $[0,1]$
- Suppose we have $y=0$ and $\hat{y}_0 = 0.9$, with $\gamma=1$. 
	- Then, $(1-0.9)^{1} \cdot CE = 0.1CE$
	- Very low weight.
- Suppose we have $y=0$ and $\hat{y} = 0.99$. 
	- Note this is a **hard** example since we are very wrong.
	- Our probability for $y=0$ is thus $\hat{y}_0 = 1-0.99 =0.01$.
	- Focal loss thus becomes $(1-0.1)^1=0.99 CE$
	- Notice how this "harder" example has more weight!

We can see that our $\gamma$ focusing term here down-weights values, but particularly down-weights values which the model does well on.

The larger the $\gamma$, the stronger the down-weighing.

----
# Source:
[Focal Loss for Dense Object Detection](https://arxiv.org/pdf/1708.02002) (Lin et al 2018)
GaTech DL

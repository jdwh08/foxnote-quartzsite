---
aliases: 
tags:
  - cs/theory
  - ds/ml/theory
  - ds/ml/bayesian
edited: 2025-06-12T18:57
created: 2024-03-19T22:06
---
# Definition:

Try to learn the **best** hypothesis for a [[Machine Learning]] model given the data (+ domain).
- where **best** refers to the *most probable*: $\arg_h \max P(h | data)$

---
# Notes:

### Notation
[[Bayes' Rule]]: $P(h|d) = \frac{P(d|h) * P(h)}{P(d)}$. 
- $P(d)$ is a prior for the data. 
- $P(h)$ is a prior for the hypothesis. "Domain Knowledge".
- $P(d|h)$ is probability of data given the hypothesis, i.e., [[Likelihood]]
	- Very easy to compute from empirical

### Methods for Maximizing Probability
If we want to find the model that maximizes $P(h|d)$, we could...
- Drop $P(d)$ since irrelevant to h; this maximizes the a-posterior [[Maximum A Posteriori Estimation]]
	- NOTE: $\arg \max P(d|h) * p(h) = \arg\max (\log P(d|h) + \log P(h))$ 
	- $\arg\min (-\log P(d|h) - \log P(h))$
	- We can use [[Information Theory]] where $-\log P(h)$ is the "length" of the model, i.e., how many bits of information it takes to send, and $-\log P(d|h)$ measures the information needed to go from the model to the actual data, i.e., error.
	- This is the **Minimum Description**!
	- If we assume the sizes are represented by $\log$ like in information theory, we favour models which are both small and have low error.
- Drop $P(h)$ and assume a [[Uniform Distribution]] for priors
- This is the [[Maximum Likelihood Estimation]] estimator.
	- NOTE: not actually practical in some cases if the number of possible models is large.

### Noise Free Example
If we know that the data is noise free, the true [[Data Generating Process]] is in our dataset, and we have a [[Uniform Distribution]] as prior...
- $P(h)=1/|H|$
- $P(d|h)=\mathbb{1}(d=h(x))$ aka model matches data aka [[Version Space]]
- $P(d)= \sum P(d|h) * p(h) = |VS| / |H|$
- $P(h|d) = 1 / |VS|$ wow yeah equal probability for all models that match the data.
- NOTE: this means that an algorithm which 

### Normally Distributed Noise
If we know the noise in the labels is [[Normal Distribution|normally distributed]], this is the classic MLE estimator resulting in minimizing the [[Mean Squared Error]].
- Normal distribution is smooth and reasonable approximation to a lot of noise, e.g., due to [[Central Limit Theorem (Lindeberg-Levy)|CLT]]
- $d=f(x)+\epsilon$, $\epsilon \sim N(0, \sigma^2)$ and [[Independent and Identically Distributed|IID]]

$$h_{MLE} = \underset{h \in H}{\arg\max}\ \Pi_{i=1}^m \frac{1}{\sqrt{2\pi\sigma^2}}e^{-\frac{1}{2}(\frac{d-f(x)}{\sigma})^2}$$

$$= \underset{h \in H}{\arg\max} \sum_{i=1}^m \ln\left(\frac{1}{\sqrt{2\pi\sigma^2}}\right)-\frac{1}{2}(\frac{d-f(x)}{\sigma})^2$$

$$= \underset{h \in H}{\arg\max} \sum_{i=1}^m -\frac{1}{2}(\frac{d-\mu}{\sigma})^2 \rightarrow \min \sum_{i=1}^m(d-f(x))^2$$

- Bayesian justification for all the MSE stuff. Doesn't work for other noise

### Predicting Probabilities with Cross Entropy
Suppose we have some binary classification and we want to learn the probability that $f(x)=1$. We also assume [[Independent Events]] for our hypothesis.

$$P(D|h) = \Pi_{i}^m P(x_i, d_i |h) \rightarrow \Pi_{i=1}^m h(x_i)^{d_i}(1-h(x))^{1-d_i}$$
where we hope that our hypothesis $h(x)=1$ if $d=1$ and vice versa.
Taking the [[Maximum Likelihood Estimation|MLE]] forces us to do 
$$\arg\max \sum d_i \ln(h(x)) + (1-d_i) \ln(1-h(x))$$
which is the justification for [[Cross Entropy]]!


NOTE: Finding best hypothesis is not the same as finding the best $\hat{y}$.
- Really speaking, we want to find the **label** not the **model**
- The [[Bayes Optimal Classifier]] is the one where all hypotheses vote weighted by their probability given the data.
---
# Examples:
- [[Naive Bayes]]

----
# Source:
Source
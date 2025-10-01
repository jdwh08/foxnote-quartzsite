---
aliases: 
tags:
  - ds/ml
edited: 2025-02-15T16:31
created: 2024-03-19T22:06
---
# Definition:
In [[Supervised Machine Learning]], reasons why we can't perfectly predict outputs given inputs.
1. Lack of knowledge about input to output (model uncertainty)
2. Intrinsic & irreducible stochastic nature of the mapping (data uncertainty)

---
# Notes:

##### Classification
Consider [[Conditional Probability]] distribution for [[Classification]]:


p(y=c\ |\ \boldsymbol{x;\theta}) = f_c(\boldsymbol{x; \theta})$


where $f_c: \mathcal{X} \rightarrow [0,1]^C$ maps inputs to a probability distribution for each label C.
- Must be between 0-1
- Must sum to 1 across all classes

Thus, we often return log-probabilities and convert them using [[Softmax]]:
 (i.e., divide the logprob by the sum of all the logprobs).


##### Regression
Consider [[Mean Squared Error]] for [[Regression]], with a [[Normal Distribution]] as the uncertainty


p(y|x;\theta) = \frac{1}{\sqrt{2\pi\sigma^2}}e^{-\frac{(y-\mu)^2}{2\pi\sigma^2}}$


Then, consider our [[Maximum Likelihood Estimation]] using the [[Log Likelihood]] approach:


NLL(\theta)=-\frac{1}{N} \left(\sum_{n=1}^{N}\log \frac{1}{\sqrt{2\pi\sigma^2}}\exp(-\frac{(y_n-f(x_n; \theta))^2}{2\pi\sigma^2})\right)$




NLL(\theta)\approx-\frac{1}{N}\left(\sum\text{blah}*(y_n-f(x_n;\theta)^2)\right)=\frac{1}{2\pi\sigma^2}MSE(\theta)$



which is good because it's proportional. Minimizing Log Likelihood is equivalent to minimizing the mean squared error.

---
# Examples:
Examples

----
# Source:
Probabilistic Machine Learning Kevin P Murphy 1.2.1.5
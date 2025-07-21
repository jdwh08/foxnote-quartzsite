---
aliases: 
tags:
  - ds/ml/theory
  - ds/ml/bayesian
edited: 2025-06-12T19:05
created: 2024-03-19T22:06
---
# Definition:
The [[Machine Learning]] method which weighs all possible ML model hypotheses based on how likely they the model is to be true.

This is the **best performance possible** given the training data.

---
# Notes:
You can think of this as the theoretically best model we can do
- [[Ensemble (Machine Learning)]] of everything

### Algorithm
$$\underset{v_j \in V}{\arg\max} \sum_h^H P(v_j|h)\times P(h_i|D)$$
- Maximize the value over all possible hypothesis models
- Of the value given the model
- Times the probability the model is true given the data


### Approximation
Since the BOC is quite difficult to calculate (*every possible model*!???), we can use [[Gibbs Sampling]].
1. Choose some model weighted based on the probability of it being true from the data $P(h_i|D)$
2. Use the model to predict the next value $x$
3. REPEAT.

Interestingly, this has error no worse than twice the true BOC. 

---
# Examples:
Examples

----
# Source:
Source
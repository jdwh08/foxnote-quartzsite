---
aliases: 
tags:
  - information_theory
edited: 2025-09-10T22:25
created: 2024-03-19T22:06
---
# Definition:

A measure about how much a variable tells you about another variable.



..I(x,y)=I(y,x) = H(Y) - H(X|Y)=\sum_{x\in X} \sum_{y \in Y} p(x, y) \log \left[ \frac{p(x, y)}{p(x)p(y)} \right]$



AKA [[Joint Probability]] times log of [[Joint Probability]] divided by [[Marginal Probability]]
OR [[Entropy (information theory)]] minus the [[Conditional Entropy]].

If mutual information is zero, we know that the two variables tell nothing about each other, i.e., [[Independent|independent]].

Note that this works for discrete variables, unlike [[R-Squared]]. We can use this for continuous variables by first making a histogram.

---
# Notes:

Related to [[Entropy (information theory)]]. Measures how much the surprise of one variable is related to another variable.

Mutual Information is a special case of [[Kullback-Leibler Divergence]]:


..D\left(p(x,y)\ ||\ P(x)P(y)\right) = \int p(x,y) \log \left( \frac{p(x,y)}{p(x) p(y)} \right)$


- I.e., a measure of the difference between [[Joint Probability]] and individual probabilities. These are the same iff [[Independent|independent]].

---
# Examples:
Examples

----
# Source:
GaTech ML
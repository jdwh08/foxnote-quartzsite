---
aliases: 
tags:
  - information_theory
edited: 2025-06-28T10:05
created: 2024-03-19T22:06
---
# Definition:

The [[Entropy (information theory)]] of one variable given another.

$$H(Y|X) = -\sum p(x,y) \log p(y|x)$$
Like [[Conditional Probability]] but applied to [[Entropy (information theory)]]

Note that if [[Independent Events|independent]], then $H(Y|X) = H(Y)$.

---
# Notes:
See also [[Joint Entropy]] for the joint version.

### Issues
This measure can be small if...
1. X tells us a lot about the outcomes of Y
2. Y has very small entropy to begin with!

To disentangle these two, we can use [[Mutual Information]] instead.

---
# Examples:
Examples

----
# Source:
Source
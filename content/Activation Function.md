---
aliases: 
tags:
  - ds/ml/nn
edited: 2025-05-25T19:07
created: 2024-03-19T22:06
---
# Definition:
A non-linear function used in [[Artificial Neural Network|Neural Network]]s.

---
# Notes:
Notes

---
# Examples:

- [[Sigmoid Function]]: old school method
- [[ReLU]]: piecewise: $f(x)=x$ if $x>0$ else $0$
	- Faster to compute and store. Our bias / intercept term $w_{k0}$ handles where the "kink" occurs.
- [[Softmax]]: convert output into multiclass probabilities.

----
# Source:

[Navigating Neural Networks: Exploring State-of-the-Art Activation Functions – OMSCS 7641: Machine Learning](https://sites.gatech.edu/omscs7641/2024/01/31/navigating-neural-networks-exploring-state-of-the-art-activation-functions/)
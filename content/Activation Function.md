---
aliases: 
tags:
  - ds/ml/nn
edited: 2025-09-10T21:57
created: 2024-03-19T22:06
---
# Definition:
A non-linear function used in [[Artificial Neural Network|Neural Network]]s.

---
# Notes:
Notes

---
# Examples:

- [[Sigmoid Function]]: old school method with smooth transitions from 0-1 around $x=0$
	- [[Hyperbolic Tangent]]: from -1 to 1

- [[ReLU]]: piecewise: $f(x)=x$ if $x>0$ else $0$. Faster to compute and store. Our bias / intercept term $w_{k0}$ handles where the "kink" occurs.
	- [[Leaky ReLU]]
	- [[GeLU]]
	- [[Maxout]]



- [[Softmax]]: convert output into multiclass probabilities.

----
# Source:

[Navigating Neural Networks: Exploring State-of-the-Art Activation Functions – OMSCS 7641: Machine Learning](https://sites.gatech.edu/omscs7641/2024/01/31/navigating-neural-networks-exploring-state-of-the-art-activation-functions/)
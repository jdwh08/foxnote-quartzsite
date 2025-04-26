---
aliases: 
tags:
  - ds/ml/nn
edited: 2025-04-26T13:03
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
Source
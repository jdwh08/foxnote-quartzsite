---
aliases:
tags:
  - ds/ml/nn/activation
  - math/geometry
edited: 2025-09-05T22:02
created: 2024-03-19T22:06
---
# Definition:
The hyperbolic tangent, i.e., the sin/cos for the unit [[Hyperbola]] instead of the unit circle.



\tanh(x) = \sinh(x) / \cosh(x)$



---
# Notes:

### As an [[Activation Function]]
- Essentially an alternative to the [[Sigmoid Function]] which ranges from -1 to 1 instead.
- Values around 0 have near-linear gradient. [[Gradient]] is always positive.
- Still saturated near both ends, so has vanishing/exploding gradients.

---
# Examples:
Examples

----
# Source:
Source
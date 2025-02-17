---
aliases: 
tags:
  - ds
  - stats
edited: 2025-02-16T19:41
created: 2024-03-19T22:06
---
# Definition:
[[Parametric Statistics]] models the data by getting some values called parameters and applying them into some functional form. Once we know all the parameters, we know the model.

[[Nonparametric Statistics]] is a type of instance-based learning where we use the training set data to come up with our answers (no parameters).


**Parametric approaches outperform IF the parametric form chosen is close to the true form for $f$.**
**Parametric approaches outperform if we do not have enough observations per feature.**
**Parametric approaches tend to be easier to explain and interpret.**

---
# Notes:

| Trait             | Parametric | Non-Parametric |
| ----------------- | ---------- | -------------- |
| Training Time     | Slower     | Faster???      |
| Inferencing       | Fast       | Slower         |
| Model Bias        | High       | Low            |
| Model Flexibility | Lower      | Higher         |

---
# Examples:

Modelling a cannonball's distance based on its angle and power ($\theta, v \rightarrow dist$)
- Clearly solved via parametric.
- We have a strong and useful bias due to physics.

How many honeybees will visit a flower given its shape and colour?
- Plausibly solved as non-parametric
- We have no clear idea of what the theory or true DGP shape is.

----
# Source:
Source
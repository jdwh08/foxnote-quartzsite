---
aliases: 
tags:
  - econ
  - todo
  - ds/ml/loss_function
edited: 2025-02-17T09:12
created: 2024-03-19T22:06
---
# Definition:
A measure of statistical dispersion for inequality.

---
# Notes:

#### Calculation

##### For [[Machine Learning]]:
This is slightly simplified from the economics calculations:


..G=1 - \sum_{i}^{|C|} p(c_i)^2$


where $|C|$ is the total categories, $p(c_i)$ is the probability of being in category $c_i$.

##### Lorenz Curve
Calculated as the area under the Lorenz curve divided by the total area for "equality"

#todo : graph with [[Lorenz Curve]], perfect inequality, etc.

##### From the Population
This is the same as:


..G=\frac{1}{n}\left(n+1-2(\frac{\sum_i^n(n+1-i)y_i}{\sum_i^n{y_i}})\right)$


We can estimate this with


..\hat{G}(s)=1-\frac{2}{n-1}\left(n-\frac{\sum_i^n i*y_i}{y_i}\right)$


though this is a [[Bias (estimator)|biased estimator]].

##### From the Discrete Probability Distribution


..G=\frac{1}{2(\sum y_i f(y_i))} \sum_i \sum_j f(y_i) f(y_j)\ |y_i-y_j|$



---
# Examples:
Examples

----
# Source:
Source
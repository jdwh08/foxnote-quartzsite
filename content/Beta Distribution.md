---
aliases: 
tags:
  - stats/distributions
edited: 2025-09-24T17:05
created: 2024-03-19T22:06
---
# Definition:
A Distribution that models the **[[Probability]]** of **probabilities** (on [[Bernoulli Trial]])

Characterized by $Beta(\alpha, \beta)$, where $\alpha$ is the number of "successes" and $\beta$ as "failures."

---
# Notes:

### Requirements
1. Since [[Probability]] is only defined on 0-1, the [[Function Domain]] is 0-1.
2. The mean should be close to the [[Sample Mean]]
3. The variance should be close to the [[Sample Variance]]

### Properties
1. **Mean**: $\frac{\alpha}{\alpha + \beta} \rightarrow p(1)$
2. **Variance**: $\frac{\alpha \beta}{(\alpha + \beta)^2 (\alpha + \beta + 1)} \rightarrow p(1-p)$

---
# Examples:
- Very useful [[Conjugate Prior]] for the [[Beta Binomial Model]] in [[Bayesian Statistics]].

----
# Source:
Source
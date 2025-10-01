---
aliases: 
tags:
  - cs/theory
  - ds/ml/theory
edited: 2025-06-08T11:18
created: 2024-03-19T22:06
---
# Definition:

A [[Machine Learning]] method which makes no assumption about the true [[Data Generating Process]] and just finds the hypothesis with the lowest error.

- Useful if we don't know whether the true DGP is in the "hypothesis space" that our learner can represent.

Differs from [[Probably Approximately Correct Learning|PAC Learning]] in that we no longer have a "true concept".
- Handles [[Statistical Learning|Irreducible Error]] and noise better.

---
# Notes:

#### Required Data Complexity:

**Hoefferding Bounds**: If training error is measured over some set $D$ containing $m$ randomly chosen examples, then...


P(error_D(h)>error_D(h) + \epsilon) \le e^{-2 m \epsilon^2}$



This means that


m\ge\frac{1}{2\epsilon^2}(\ln|H|+\ln \frac{1}{\delta})$


Which is worse than in [[Haussler's Theorem]] for [[Probably Approximately Correct Learning|PAC Learning]] (note the $2\epsilon^2$ and $\epsilon \le 0.5$)

---
# Examples:
Examples

----
# Source:
Source
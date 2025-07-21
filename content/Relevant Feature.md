---
aliases: 
tags:
  - ds/ml/theory
edited: 2025-06-11T21:48
created: 2024-03-19T22:06
---
# Definition:

Measures how much information a feature tells you about the label.

---
# Notes:

- $x_i$ is **Strongly Relevant** if removing it degrades the [[Bayes Optimal Classifier]] (classifiers weighted on each probability, best you can do)
- $x_i$ is **Weakly Relevant** if it is not strongly relevant AND adding it would improve the performance of the [[Bayes Optimal Classifier]] in some subset of features.
- $x_i$ is **Irrelevant** otherwise.
- **THIS IS ALL ABOUT INFORMATION** that a variable has.

Not quite the same as a [[Useful Feature]], which ignores information and just asks if it reduces loss.

---
# Examples:
Examples

----
# Source:
Source
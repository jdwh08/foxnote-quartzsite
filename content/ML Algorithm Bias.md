---
aliases:
  - Restriction Bias
  - Inductive Bias
tags:
  - ds/ml
edited: 2025-05-25T12:10
created: 2024-03-19T22:06
---
# Definition:
The assumptions of the machine learning algorithm as part of learning. i.e., "which patterns do we learn" and "why learn this pattern"?

E.g., a good bias is that the ML algo will learn a pattern that generally predicts the output (duh!) but there are others.

---
# Notes:

#### Restriction Bias:
- What is the set of possible representations that we consider?

#### Preference Bias:
- Why do we prefer certain types of representations over others?

---
# Examples:
[[ID3 (Decision Tree Algorithm)]]:
- Our **restriction bias** is a series of nodes with splitting.
- Inductive Bias tree splits early based on "best feature", so it favours shallow trees with early splits.

----
# Source:
Source
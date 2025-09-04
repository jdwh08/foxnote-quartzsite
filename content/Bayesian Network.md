---
aliases: 
tags:
  - ds/ml/bayesian
edited: 2025-07-27T14:41
created: 2024-03-19T22:06
---
# Definition:
A [[Machine Learning]] model which estimates things using a [[Graph]] structure and [[Bayes' Rule]].

---
# Notes:

### Algorithm
Suppose we have some $X$ which is [[Conditional Independence]] to $Y$ given $Z$, so that $P(X...X | Y...Y, Z...Z) = P(X...X | Z...Z)$.


We can link these conditional dependencies together into a graph; e.g., if thunder is dependent on lightning we can draw that as an arrow.

---
# Examples:

Suppose we want to know if the grass is going to be wet.
This happens if the sprinkler is on, or if it rained.
The sprinkler rarely turns on if it rains.

![[Bayesian Network.excalidraw.png.png]]
- Note that Grass Species is [[Conditional Independence]] from these.

----
# Source:
Source
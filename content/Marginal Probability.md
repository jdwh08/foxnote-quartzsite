---
aliases: 
tags:
  - stats/probability
edited: 2025-09-10T22:25
created: 2024-03-06T20:30
---
### Definition:
From a [[Joint Probability]], get the [[Probability]] that *one* of the two [[Random Variable]]s lands on a specific value.

For the discrete case with [[Probability Mass Function]]s,
- $p_X(x) = \sum_{y \in \mathcal{Y}} P(X=x \hat Y=y) = \sum_{y \in \mathcal{Y}} p(x,y)$

---
### Notes:
You can relate this to the *partition rule* in [[Probability]], where we recover P(x) from the joint probability by summing across all the possible values of $y$.

We can always recover the marginal from the joint, but not vice versa -- to go the other way, we need them to be [[Independent]].

---
### Examples:
Examples
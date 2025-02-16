---
aliases: 
tags:
  - ds
  - information_theory
edited: 2025-02-15T16:27
created: 2024-03-19T22:06
---
# Definition:
A metric to determine how much we reduce randomness after knowing about our additional feature.

Start with the existing [[Entropy (information theory)]]. Then, determine the new entropy across all possible values $v\in V$ of our our new feature $s$. See how much the entropy dropped.
$$\text{Gain}(s,a)=\text{Entropy}(s) - \sum_{v}^{V}\frac{|s_v|}{s}*\text{Entropy}(s_v)$$
(i.e., we want a process which makes the outcomes as un-random and mixed as possible. think about [[Entropy (physics)]] and then sorting the hot and cold stuff.)

---
# Notes:
Used as a [[Loss function]] for finding features for training [[Decision Trees]], e.g., the [[ID3 (Decision Tree Algorithm)]]

---
# Examples:
Examples

----
# Source:
Source
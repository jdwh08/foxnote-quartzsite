---
aliases: 
tags:
  - ds/ml/rl
  - stats
edited: 2025-03-15T21:38
created: 2024-03-19T22:06
---
# Definition:
A category of problem where actions cause transitions between states that satisfy the [[Markov Property]]. Baseline for [[Reinforcement Learning]] theory.

Formally:
1. Set of states **S**
2. Set of actions **A**
3. Transition Function: $T(s, a, s')$ that gives the probability that taking action $a$ at state $s$ results in new state $s'$.
	1. Note that these are [[Probability]] and thus must sum to 1.
	2. Note that this is constant and stateless i.e., satisfies the [[Markov Property]].
	3. Typically unknown and must be estimated.
4. Reward Function: $R(s, a)$. Typically unknown.
5. Problem:
	1. Find best choices $\pi^*(s)$ resulting from $\underset{a}{\arg\max R}$

Thus, our training data is tuples of $(s_1, a_1, s'_1, r_1), ..., (s_n, a_n, s'_n, r_n)$

---
# Notes:
Notes

---
# Examples:
Examples

----
# Source:
Source
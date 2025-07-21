---
aliases: 
tags:
  - ds/ml/rl
  - stats
edited: 2025-07-19T19:21
created: 2024-03-19T22:06
---
# Definition:
A category of problem where actions cause transitions between states that satisfy the [[Markov Property]] (only the present info matters).

Baseline for [[Reinforcement Learning]] theory.

---
# Notes:

## Formal Definition
1. Set of states **S**
2. Set of actions **A** (note this can depend on state)
3. Transition Function: $T(s, a, s')$ that gives the probability that taking action $a$ at state $s$ results in new state $s'$. (This is our model)
	1. $T(s,a,s') \approx P(s' | s, a)$
	2. Note that these are [[Probability]] and thus must sum to 1.
	3. Note that this is constant and stateless i.e., satisfies the [[Markov Property]].
	4. Typically unknown and must be estimated.
4. Reward Function: $R(s, a)$. Typically unknown.
	1. Approximates the "usefulness" of something
	2. Reward for state $R(s)$, reward for state and action $R(s,a)$, reward for state and action leading to new state $R(sas')$.
		1. These are uh... mostly the same under MDP. We can incorporate the rewards from future state $S'$ or reward $a$ into the current reward.
		2. This is kinda like the Q function in [[Q-Learning]].
5. Problem:
	1. Find best choices $\pi^*(s)$ resulting from $\underset{a}{\arg\max R}$
	2. This is the goal, aka the Policy, with the best long-term policy being $\pi^{*}$

Thus, our training data is tuples of $(s_1, a_1, s'_1, r_1), ..., (s_n, a_n, s'_n, r_n)$

### Important Assumptions
1. Process is **MARKOV**, i.e., only current information matters.
2. World and Transition Function **do not change**!
3. We correctly know the current state and possible actions we can take.

---
# Examples:
Examples

----
# Source:
GaTech ML
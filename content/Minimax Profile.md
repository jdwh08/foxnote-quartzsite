---
aliases: []
tags:
  - econ/game_theory
edited: 2025-07-19T17:42
created: 2024-03-19T22:06
---
# Definition:

In [[Game Theory]], the payoffs for each player that represent what happens when players defend themselves against a malicious adversary.

---
# Notes:

Malicious adversary: goal is to give you the worst possible score, e.g., as if they were in a [[Zero Sum Game]].

---
# Examples:

**Battle of the Sexes**
![[Battle of the Sexes#Definition]]

Suppose we have Pure Strategy Games.
- If P1 picks B, P2 picks B
- If P1 picks S, P2 picks S; you get higher score, this is not malicious
- Thus, B/B coordination is best, so your [[Minimax]] Profile Reward is 1.

Suppose we have Mixed Strategy Games.
- P2 picks B with some probability $p$.
- Consider the [[Minimax]], i.e., best worst case, for P1.
- Rewards for P1 are $1p$ for B pure, $2(1-p)$ for S pure, implying $p=2/3$
- #todo this makes no sense.
 

----
# Source:
Source
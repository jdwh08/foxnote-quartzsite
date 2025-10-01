---
aliases: 
tags:
  - econ/game_theory
edited: 2025-07-19T19:43
created: 2024-03-19T22:06
---
# Definition:

The "natural result" in [[Game Theory]] if all players behave optimally, i.e., **players are always worse off doing something different across all states**. 

---
# Notes:

## Formal Definition

Suppose there are $N$ players with strategies $S_1, ..., S_N$.
- $(s_1^*, s_2^*, ... s_N^*)$ are a Nash Equilibrium IFF



\forall i \in N, s_i^* = \underset{s_i}{\arg\max}\ U_i(s_1^*, ..., s_i, ... s_n^*)$



I.e., no player cannot improve on their [[Utility]] by picking some other strategy.


This is true for both PURE strategies and MIXED strategies.
- In PURE, we can do this by iteratively removing all values which are STRICTLY DOMINATED (i.e., always worse). Then, we can look at shifts.
- In MIXED, we have each player define their action probability distribution.

### Theorems
1. In a $n$ player pure strategy game, if we can get to only one result by removing all strictly dominated strategies, that result must be the unique Nash Equilibrium.
2. Any Nash Equilibrium will survive elimination of strictly dominated strategies.
3. If $n$ players are finite and $\forall\ i\ S_i$  is finite (finite game, finite strategy) then there exists some (MIXED) Nash Equilibrium.


Computing the Nash Equilibrium is at least [[NP-Hard]].

---
# Examples:

## Prisoner's Dilemma

| A / B  | Silent  | Defect  |
| ------ | ------- | ------- |
| Silent | -1 / -1 | -9 / 0  |
| Defect | 0 / 9   | -6 / -6 |

We see the Nash Equilibria is Defect / Defect :(

## Three Actions

| $\alpha\ /\ \beta$ | A     | B     | C     |
| ------------------ | ----- | ----- | ----- |
| A                  | 0 / 4 | 4 / 0 | 5 / 3 |
| B                  | 4 / 0 | 0 / 4 | 5 / 3 |
| C                  | 3 / 5 | 3 / 5 | 6 / 6 |

We see the Nash Equilibria is C / C.

----
# Source:
Source
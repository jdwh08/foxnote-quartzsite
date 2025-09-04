---
aliases:
  - Bach or Stravinsky
tags:
  - econ/game_theory/game
edited: 2025-07-22T19:23
created: 2024-03-19T22:06
---
# Definition:

A [[Game Theory]] game where two players must coordinate on the same action, but each prefers coordinating to a different action.

| P1 ↓ / P2 → | B   | F   |
| ----------- | --- | --- |
| B           | 1,2 | 0,0 |
| F           | 0,0 | 2,1 |


---
# Notes:
A man (P1) and a woman (P2) want to spend the evening together. 
- They can either go to the Ballet / Bach or to the Fight / Stravinsky. 
- They cannot coordinate ahead of time.
- The man slightly prefers the Fight, the woman slightly prefers Ballet, but both want to be together.

The Pure Strategy [[Nash Equilibrium]] are B,B or F,F. Otherwise they get zero payoff if they switch.

The Mixed Strategy Nash Equilibria are as follows:
- Suppose we are P1. We go to the ballet with probability $\sigma$.
- Now we get P2's rewards for pure strategy based on our choice.
	- $U_2(B)=\sigma * 2 + (1-\sigma) * 0$
	- $U_2(F) = \sigma * 0 + (1-\sigma)*1$
	- These are indifferent when $2\sigma = 1-\sigma \rightarrow \sigma = 1/3$
	- Thus, P1's mixed equilibria strategy is going B $1/3$ of the time.
- Vice versa
	- P2's mixed equilibria strategy is going B $2/3$ of the time.

---
# Examples:
Examples

----
# Source:
Source
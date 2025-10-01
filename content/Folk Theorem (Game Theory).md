---
aliases:
tags:
  - econ/game_theory
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:

> "In infinite games (or repeated with unknown end), the possibility of future retaliation allows for a possible [[Nash Equilibrium]] to cooperate."

---
# Notes:

## Formally

> Any feasible payoff profile that strictly dominates the [[Minimax Profile]] can be a  [[Nash Equilibrium]] payoff profile if the future discount factor $\gamma$ is large enough

## Proof
- We act as a dictator, and require players to collude to obtain the desired payoffs.
- If the other players do not cooperate, we turn into [[Grim Trigger (Game Theory)|GRUDGER]]
	- This forces all other players to do [[Minimax]] and get the [[Minimax Profile]]
	- That's bad.
- If minimax profile is worse whatever the dictator wants, it is better for them to cooperate.
	- E.g., The Golden Balls Incident: *I'm going to steal, and we'll split after the show.*

## The Computational Folk Theorem
For any two player game with two different reward matrices (i.e., not [[Zero Sum Game]])...
- You can build a strategy which is [[Subgame Perfect]] in [[Big O|polynomial time]]. #cs/theory 
- This is typically [[Pavlov (Game Theory)]] like

Corollary: If you CAN'T do this, it's actually [[Zero Sum Game]].
- Then, we can use [[Linear Programming]] to solve this.
	- This creates a [[Nash Equilibrium]]
	- OR at most one player can improve, which afterwards makes it a [[Nash Equilibrium]].


---
# Examples:
[[Prisoner's Dilemma Repeated]]: We see the Folk Profile in Grey.

![[Repeated Prisoner's Dilemma Folk Theorem.png]]


----
# Source:
ML CS7646

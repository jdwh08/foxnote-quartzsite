---
aliases: 
tags:
  - econ/game_theory/strategy
edited: 2025-07-19T18:57
created: 2024-03-19T22:06
---
# Definition:
A type of strategy in [[Game Theory]] for repeated games which always gives you the best response (a [[Nash Equilibrium]]), regardless of the history.

---
# Notes:

Subgame Perfect Nash Equilibria are ways of ensuring that a strategy is actually credible, i.e., would make sense to do. This is particularly true for threats, e.g., [[Grim Trigger (Game Theory)|GRUDGER]], where actually following through on threat would force absurd, self-defeating behaviour.

We can check this by "faking" a history.

---
# Examples:

### T4T vs GRUDGER
Suppose we have [[Tit for Tat]] and [[Grim Trigger (Game Theory)|GRUDGER]] play [[Prisoner's Dilemma Repeated]].
- We know this is going to always cooperate.
	- Let's fake a different history.
- Suppose one player decides to defect.

- T4T:  CCCDDDDDD
- GRD: CCDDDDDDD

- Because defect, GRUDGER will always defect, forcing T4T to always defect.
- It would be so much better for GRUDGER to flip back to cooperating...
- Thus, this is *NOT SUBGAME PERFECT*

### T4T vs T4T
Suppose we have [[Tit for Tat]] play against itself.
- We know this is going to always cooperate.
- Suppose one player decides to defect.

- T4T: CCCDCDC...
- T4T: CCCCDCD...

- Now they alternate between C,D (-9, 0) and D,C (0, -9); if $\gamma=1$ we have (-4.5, -4.5)
	- Or if they were both always defecting, average payoffs are (-6, -6) 
- We know if $\gamma$ discounting is high enough that this is worse than always cooperate (-1, -1)
- Thus, this is *NOT SUBGAME PERFECT*


### Pavlov vs Pavlov
Suppose we have [[Pavlov (Game Theory)]] play against itself.
- By default we know it will always cooperate.

One player defection:
- PV: CCCDDCCCC...
- PV: CCCCDCCCC...

Two player defection:
- PV: CCCDCCCC...
- PV: CCCDCCCC...

We see that both correct and end up with constant cooperation.
This *IS ACTUALLY SUBGAME PERFECT WAOW*

----
# Source:
Source
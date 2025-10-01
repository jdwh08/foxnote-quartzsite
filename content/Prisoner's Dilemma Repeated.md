---
aliases:
tags:
  - econ/game_theory
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:

Repeated iterations of the [[Prisoner's Dilemma Game]], where we typically assume both sides do not know when the repetition will end.

Allows for examination of repeated strategies.

---
# Notes:

![[_Media/Excalidraw/Game Theory#Prisoner's Dilemma Game]]

## Prisoner's Dilemma Game Iterated

Suppose both players repeatedly play this game, where there is probability $\gamma$ that the game will repeat.
- Kinda similar to discounting future rewards from [[Reinforcement Learning]].
- Repetition + Uncertainty means that the single-game Nash is not optimal
	- We no longer have guaranteed backstab unlike in finite known repeated Prisoner's Dilemma.

## Possible Strategies for Iterated Prisoner's Dilemma
- We need to create representations which allow for infinite

## Tit for Tat
![[_Media/Excalidraw/Tit for Tat#Definition]]

- If we always cooperate against T4T, then we get $-1/(1-\gamma)$.
- If we always defect against T4T, then we get $0+\frac{-6\gamma}{1-\gamma}$.
- Breakeven when $\gamma=1/6$, i.e., cooperate above this, defect below.

## How do we compute the Best Response Strategy?
![[_Media/Excalidraw/Prisoner's Dilemma FSM.png]]
- We can model as a [[Markov Decision Process]] **if we ignore history**
	- [[Policy Iteration]], [[Value Iteration]], etc.
- Our possible choices are...
	- When defect, also defect $\rightarrow$ always defect
	- When cooperate, also cooperate $\rightarrow$ always cooperate
	- Do the opposite of the opponent $\rightarrow$ D,C,D,C, ...

| $\gamma > 1/6$ Opponent Strategy | Always C | Always D | T4T |
| -------------------------------- | -------- | -------- | --- |
| Always C                         |          | X        |     |
| Always D                         |          | X        |     |
| T4T                              | x        |          | X   |

We see that our mutual best responses, i.e., [[Nash Equilibrium]] are D/D and T4T/T4T

## The Repeated Games "[[Folk Theorem (Game Theory)|Folk Theorem]]" Profile
- If repeated games with unknown end, the possibility of future retaliation allows for a possible [[Nash Equilibrium]] to cooperate.
- Folk Theorem is the possible payoffs for repeated prisoner's dilemma
- What are the possible payoffs? They must be somewhere as a [[Linear Combination]] of probabilities of the four actual payoffs

![[_Media/Excalidraw/Repeated Prisoner's Dilemma Folk Theorem.png]]

- We see that the [[Minimax Profile]], i.e., the "best worst case", is defecting (from earlier analysis). This is true for both players.
- Thus, the end result is $d,d$ and payoffs of -6, -6; the blue dot.

- Under the [[Folk Theorem (Game Theory)]]

---
# Examples:
Examples

----
# Source:
GaTech ML7646

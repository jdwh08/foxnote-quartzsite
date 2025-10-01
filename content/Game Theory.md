---
aliases:
tags:
  - econ/game_theory
edited: 2025-09-30T19:34
created: 2024-03-19T22:06
---
# Definition:

Theory behind how agents behave and interact with each other.

---
# Notes:

Multiple different agents must decide the optimal **STRATEGY** (actions to take at each state).
- We assume the 
- Pure strategy: a strategy where you always pick one result.
- Mixed strategy: you pick actions based on some probabilities.

Ways to do this:
- [[Minimax]]

## [[Nash Equilibrium]]
- In a two player pure strategy zero sum deterministic perfect information game...
	- If both players use [[Minimax]], they arrive at the same ending state.
	- There always exists an optimal pure strategy for each player.
	- The Nash Equilibrium is this optimal state.

- A two player pure strategy zero sum non-deterministic perfect information game. (*von Neumann's Theorem*)
	- We use [[Expected Value]] to get payoffs...
	- Both players can achieve the optimal strategy with minimax
	- Nash Equilibria also exists.

- Once we move to *non-deterministic* and *hidden information* games, we no longer have guaranteed pure strategies!
	- However, so long as the game has *finite* players and states, there will exist some (mixed) Nash Equilibrium.

- If we have $n < \infty$ repeated games where both sides know $n$ ahead of time, the Nash Equilibrium is the same thing.
	- We know the last game will behave with single-game Nash, since no more in the future
	- This means the second to last game has no effect on the last game, so it should act with single-game Nash
	- Proof by Induction, see Prisoner's Dilemma Repeated (Finite) in Examples

---
# Examples:

## A Basic Game
**Two player**: A and B
**Zero Sum**: Sum of $r(A) + r(B) = 0$
**Finite**: There are a limited number of states and actions.
**Deterministic**: All actions will always lead to specific state (no randomness).
**Perfect Information**: Both players know exactly what state and actions they are in.

![[Game Theory Basic Game.png]]

Reward Matrix for each strategy:

|           | B Strat | **N2** | L     | M ***     | R     |
| --------- | ------- | ------ | ----- | --------- | ----- |
| A Strat   |         | **N3** | R     | R         | R     |
| **N1**    | **N4**  |        |       |           |       |
| L         | L       |        | +7/-7 | +3/-3     | -1/+1 |
| **L** *** | **R**   |        | +7/-7 | \[+3/-3\] | +4/-4 |
| R         | L       |        | +2/-2 | +2/-2     | +2/-2 |
| R         | R       |        | +2/-2 | +2/-2     | +2/-2 |

We see that using [[Minimax]] in both players, we get the same optimal pure strategy.
- A strategy is (N1: L, N4: R)
- B strategy is (N2: M, N3: R)

Nash Equilibria is (LR, MR) with payoffs +3/-3.


## A Simple Non-Deterministic Game
Two player zero sum finite *nondeterministic* perfect information game!
We assume payoffs are based on [[Expected Value]].

![[Game Theory Simple Nondeterministic Game.png]]

| A / B | L                        | R                     |
| ----- | ------------------------ | --------------------- |
| L     | $0.5*4+0.5*-20=$ -8/+8   | $0.5*4+0.5*-20=$-8/+8 |
| R     | $0.8*-5 + 0.2*10 =$-2/+2 | +3/-3                 |
|       |                          |                       |

A strategy is to go Right (since L is dominated strategy, always worse)
B strategy is to go Left (since it is better off)

Nash Equilibria is (R, L) with expected payoffs -2/+2.


## A Hidden Information Non-Deterministic Game
Two player zero sum finite *nondeterministic* *hidden* information game!

1. A is dealt a card, Red or Black; 50/50 probability.
2. A can...
	1. Resign: -20 for A
	2. Hold. B then can...
		1. Resign: +10 for A
		2. Show Card: 
			1. Red: -40 for A
			2. Black: +30 for A

We see hidden information since B does not know what A's card is.
- Note that it is irrational for A to resign on black cards, since always worse off.

This time, rewards must consider [[Expected Value]] across Red and Black scenarios.

| A / B  | Resign                             | Show                      |
| ------ | ---------------------------------- | ------------------------- |
| Resign | $-20 * 0.5 + 10 * 0.5 =$ -5 / +5   | $-20*0.5+30*0.5=$ +5 / -5 |
| Hold   | $+10 * 0.5 + 10 * 0.5 =$ +10 / -10 | $0.5*-40+0.5*30=$ -5 / +5 |

We see now that hidden information no longer has equilibria pure strategies!
Instead, we now need to have **mixed** strategies.
- Suppose B always resigns. Then A's reward is $-5 * (1-p) + 10 * p = 15p-5$, where $p$ is A's mixed strategy probability for holding.
- Suppose B always shows. Then A's reward is $5 * (1-p) - 5 * p = -10p + 5$, where $p$ is A's mixed strategy probability for holding.
- We see that these two strategies have the same payoff when $25p=10 \rightarrow p=0.4$
- This gives an average mixed strategy payoff of 1.
- B's mixed strategies MUST be somewhere between the B-Shows and B-Resigns lines.
	- We can thus [[Minimax]] over the probabilities!
	- Note that in other games, minimax optimal strategy is a corner solution (e.g., $p=0, 1$ i.e., a pure strategy)

![[Game Theory Hidden Info Payoffs.png]]

## Prisoner's Dilemma Game
![[Prisoner's Dilemma#Definition]]

## [[Prisoner's Dilemma Repeated]] (Finite)
Suppose we repeatedly play $K < \infty$ Prisoner's Dilemma games.
- For the last game, it's the same as the regular Prisoner's Dilemma. It would be advantageous to backstab.
- Then, in the second to last game, we know someone is going to backstab. That means solidarity will not matter. It would be advantageous to backstab.
- This logic is true for the $i$-th game. [[Proof by Induction]].
- Thus, we should always defect for all games.

## [[Prisoner's Dilemma Repeated]] (Infinite)



----
# Source:
Source
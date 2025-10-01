---
aliases: 
tags:
  - econ/game_theory
  - ds/ml/rl
edited: 2025-07-19T20:14
created: 2024-03-19T22:06
---
# Definition:
A formal model of multi-agent games in [[Game Theory]].

(The [[Game Theory]] analogue of [[Markov Decision Process]] for [[Reinforcement Learning]])

---
# Notes:

## Formal Definition
1. Set of states **S**
2. Set of actions **A** for each player $a \in A_1, b \in A_2$
3. Transition Function: $T(s, [a, b], s')$ that gives the probability that taking action $a$ at state $s$ results in new state $s'$.
4. Reward Function: $R_1(s, [a, b])$ and $R_2(s, [a,b])$
5. Discount factor $\gamma$

Note that this formal definition is a broader version of a [[Markov Decision Process]] (even though Shapley published SGs before Bellman published MDPs)

### Examples as Other Games
1. [[Zero Sum Game]]: $R_1 = -R_2$
2. [[Markov Decision Process]]: (i.e., P2 doesn't matter)
	1. $T(s, [a,b], s') = T(s, [a, b'], s')\ \forall\ b'$ 
	2. $R_2 = R_1, R_1(s, [a,b]) = R_1(s, [a, b'])\ \forall\ b'$
3. Repeated Game: $|S|=1$, i.e., transition is always back to the same state.


## Solutions
We can kinda do [[Q-Learning]] for this(?).

#### For [[Zero Sum Game]]s
This is known as **Minimax-Q**


..Q(s, [a,b]) = R_i(s, [a,b]) + \gamma \sum_{s'} T(s, [a,b], s') \times \underset{a', b'}{\text{minimax}}\left(Q(s', [a',b']\right)$


Note that [[Minimax]] here assumes the worst possible future actions from the other player.

For [[Zero Sum Game]], things that work include...
- [[Value Iteration]]
- It converges just like [[Q-Learning]]! to a unique solution Q*
- Policies for the two players can be calculated independently (no collaboration, since minimax)
- Can update quite efficiently since [[Minimax]] can be solved with linear programming.
- We can use Q* to a policy like in [[Reinforcement Learning]].

Things that don't work for this...
- We don't know if this can be solved in [[Big O|linear time]] anymore.

#### For General Sum Games
Minimax no longer makes sense because the other player might have different rewards.
- Instead, we can compute the [[Nash Equilibrium]] to make **Nash-Q**



..Q(s, [a,b]) = R_i(s, [a,b]) + \gamma \sum_{s'} T(s, [a,b], s') \times \underset{a', b'}{\text{Nash}}\left(Q(s', [a',b']\right)$



Alas, this sucks monkey biscuits.
- [[Value Iteration]] doesn't work.
- **It doesn't converge. No unique Q*.***
- Policies need to be computed together due to Nash.
- Updating sucks since computing Nash is NP-Hard.
- The Q* function is not enough to specify a policy due to not enough info.

### Possible Weird Solutions
- Model as repeated stochastic games to create [[Folk Theorem (Game Theory)]] ideas?
- Implement a channel that allows players to coordinate in a non-binding way. This creates a [[Correlated Equilibrium]], i.e., Nash but with some coordination. We can then approximate the solutions near-optimally. 
- Cognitive Hierarchy: assume other players are dumber (compute less), and then find the best response. *Models humans in lab settings*.
- Side Payments: allow players to split rewards. CoCo values are cooperative-competitive values that allow us to kinda get to zero sum?

---
# Examples:

### Cash Grab

|     | $   |     |
| --- | --- | --- |
| ___ |     | ___ |
| A   |     | B   |

- A and B are in a 3x3 matrix, and are competing to see who will get the money.
- Moving through the thick walls ___ gives a 50% probability that they stay in place.
- Only one person can be in each cell. If they both try, coin flip on who gets there first.

What the heck does a [[Nash Equilibrium]] mean for this game?
Neither player would want to change their strategies (multi turn).

| →     | $   | ←     |
| ----- | --- | ----- |
| \_↑\_ |     | \_↑\_ |
| A     |     | B     |
This is the cooperative strategy, where both A and B are nice and each try to go through the thick walls. This gives $p=0.5$ success for each.

| →     | $   |        |
| ----- | --- | ------ |
| \_↑\_ | ↑   | \_\_\_ |
| A     | ↑←  | B      |

Now B is a jerk and takes the center, giving $p=1$ for success. This is clearly better for B. However, if A tries to contest, it results in a $p=0.5$ collision (i.e., the same). This is NASH.

----
# Source:
Source
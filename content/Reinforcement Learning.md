---
aliases: 
tags:
  - ds/ml/rl
edited: 2025-05-14T20:37
created: 2024-03-19T22:06
---
# Definition:
A type of [[Machine Learning]] which solves a problem via giving an **agent** at some environmental **state** possible **choices** and **rewards** for choices.
- Reward(s) are NOT necessarily immediate. 

Agent then learns the optimal choices at each state, called a **policy**.

---
# Notes:

### Possible Solutions
#### Model Based
Convert experiences into a table. Use this information to build a model to estimate the transition function $T(s, a, s')$ and rewards $R(s, a)$. Model based typically gets more learning out of experiences.
- Use [[Value Iteration]] or [[Policy Iteration]] for this

#### Model Free / Direct
Develop a policy directly using only the data, and no assumptions. Direct and simpler.
- Example is [[Q-Learning]]

#### Optimization Horizon
- Infinite Horizon: an unlimited number of actions can be done. 
- Finite Horizon: only consider actions up to $i$ steps.

### Reward Discounting
Similar to [[Hyperbolic Discounting]] of [[Utility]] in Economics, or [[Time Value of Money]]. Rewards in the future should be worth less than rewards now.
- Discounted reward: $\sum_{i=1}^{\infty} \gamma^{i-1} * r_i$
- $\gamma$ controls the hyperbolic discounting rate, and is set between $0 < \gamma \le 1.0$.
	- $\gamma=1$ is the same as infinite horizon due to infinite consideration.

---
# Examples:

## [[Markov Decision Problem]]

#### Robot Navigation
Robots act in a "sense, think , act" cycle.
1. Robot senses the environment. (Gridworld with obstacles)
2. Robot thinks about which action(s) to do (calculate policy $\pi$)
	1. Actions are stuff like movement directions.
	2. Determine policy via rewards over time.
3. Robot acts on environment to get to new state.

#### Finance Trading
#ds/ml/ML4T Suppose we have a trading system. We can think of it via:
1. States: Current position, indicators, features, etc.
	1. Note that states for the learner should be normalized and comparable over time (and probably between stocks). E.g., AdjClose is not comparable.
	2. Additional factors besides typical indicators are things like current position size and return since entry.
	3. For #ds/ml/ML4T , we treat state as an integer (i.e., valid index in lookup table)
		1. Discretize each table to convert floats into integers.
			1. Determine the number of steps or bins
			2. Get step size as number of values per bin
			3. Partition data into its relevant bin
		2. Combine into a single number. ([[Hash Function]] maybe?)
2. Actions: Buy / Sell / Nothing.
3. Rewards: Returns.
	1. But what kind of returns matters!
	2. **Immediate Rewards**: Daily returns. This converges faster since it gives the agent immediate feedback on how it is doing.
	3. **Delayed Rewards**: Returns as 0 until exiting the position requires 
4. Test on future data after promising backtests.

----
# Source:
Source
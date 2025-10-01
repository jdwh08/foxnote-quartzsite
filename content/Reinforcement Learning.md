---
aliases:
tags:
  - ds/ml/rl
edited: 2025-09-30T21:59
created: 2024-03-19T22:06
---
# Definition:
A type of [[Machine Learning]] which solves a problem via giving an **agent** at some environmental **state** possible **choices** and **rewards** for choices.
- Reward(s) are NOT necessarily immediate. 
- Resulting output is a "policy" which gives the action(s) to take at each state.

Agent then learns to make choices at each state, called a **policy**.

---
# Notes:

## Contrast to [[Supervised Machine Learning]]
1. We can (roughly) map RL as similar to SL...
	1. $S$ states are input features $X$
	2. $A$ actions are our target $Y$
	3. But we're also given some rewards $R$
2. Rewards and actions depend on the current state $S$
3. Reward(s) must be determined and assigned. Final "success" was due to which action(s) taken?
	1. This is the [[Credit Assignment Problem]]. 
4. [[Reward Function]] has a huge impact on the resulting policy learned.
	1. Reward function should represent our domain knowledge.

## Model-Based Design Assumptions

### 1. [[Markov Decision Process]]

- Set of states **S**
- Set of actions **A** (note this can depend on state)
- Transition Function: $T(s, a, s')$ that gives the probability that taking action $a$ moves from $s \rightarrow s'$
- Rewards $R(s)$ for being at state (or state + action, state + action + future state)

##### Discretization
- Note that infinite states **$S$**, e.g., with continuous variables, make this problem become extremely hard.
- In practice, people will often discretize continuous variables to have limited states.
	- Allows for finite states
- Discretization Techniques:
	- Basic Uniform Binning
	- More advanced binning (e.g., around decision or tipping points)
	- Tile Coding: create overlapping bins which are weighted together.
- Discretization Tradeoffs:
	- More bins = more resolution = more fitting policy
	- Fewer bins = less computation, less experience data needed, less memory needed
	- Note that combinations of states grows quickly

### 2. World Errors
- State could potentially be wrong, or unsure about current state.
- **Actions may execute incorrectly.**
	- We often assign an error probability for this.

### 3. Optimization Horizon
- **Infinite Horizon**: an unlimited number of actions can be done. 
- **Finite Horizon**: only consider actions up to $i$ steps.
- Note that horizon can change the optimal action!
	- Finite horizon might encourage more risk to end at positive within horizon.

### 4. Utility of Sequences
- We assume [[Utility]] doesn't matter based on when sequence starts
- If I prefer $U(s0, s1, s2, ...) > U(s'0, s'1, s'2, ...)$ then I should also prefer $U(s1, s2, ...) > U(s'1, s'2, ...)$
- This assumption is needed so that we *add up rewards* over time
	- $U(s...s) \approx \sum_t R(s_t)$

### 5. Reward Discounting
Exponential Discounting (not Hyperbolic) of [[Utility]] in Economics, e.g., [[Time Value of Money]].
Rewards in the future should be worth less than rewards now.
- **If we DON'T do this, things blow up to infinity and then things become equivalent, i.e., not converging!**
- Discounted reward: $\sum_{i=0}^{t} \gamma^{i} * r_i$
- $\gamma$ controls the hyperbolic discounting rate, and is set between $0 \le \gamma \le 1.0$.
	- $\gamma=1$ is the same as infinite horizon due to infinite consideration.
- If infinite horizon, this is a [[Infinite Geometric Series]], so values cannot be higher than $\frac{R_{\max}}{1-\gamma}$.

### From Assumptions to [[Bellman Equation]]
For a infinite horizon with constant utility preferences and hyperbolic discounting...
$$\pi^* = \underset{\pi}{\arg\max}\ E \left[ \sum_{t=0}^{\infty} \gamma^t R(s_t) | \pi \right]$$
Policy utility is the expected value of rewards over time (**the long term**)
$$U^*(s) = E \left[ \sum_{t=0}^{\infty} \gamma^t R(s_t) | \pi \right]$$
We can rewrite the policy to be
$$\pi^*(s) = \underset{a}{\arg\max} \sum_{s'} T(sas')\times U^*(s)$$
We can also rewrite the optimal utility by unrolling to be
$$U(s) = R(s) + \gamma \max_a \sum_{a'} \pi(sas')\times U^*(s)$$

Note that people typically will prefer keeping rewards together:
$$U(s) = \underset{a}{\max} \sum_{s'} T(s'|s,a)\left[R(s) + \gamma U(s')\right]$$

And... oh crap, this is a [[Bellman Equation]].
- Once we determine utilities for all states, we can determine the optimal policy.

### Solving the Bellman
- [[Value Iteration]]: Repeatedly update the utility values until they converge.
- [[Policy Iteration]]: Repeatedly update the optimal policy until it converges.


## Possible RL Components

![[RL Components.png]]

#### Policy:
Converts states $s$ into actions $a$. This is our goal.
- If we try to learn this directly, it's called [[Policy Search]] algorithms.
- However, policy is very indirect consequence of many things.
- Issue with the [[Credit Assignment Problem]].

### Utility:
Converts states $s$ into their final utility values $v$.
- These are **Value-Function Based RL**
- We then take the utility values and convert them into actions (the policy), using something like $\arg\max$.

### Model
Convert states $s$ and actions $a$ into new state $s'$ probabilities with **Transition Function** + rewards with **Reward Function**

#### Modeller
Convert data (SA) into a model -- estimate the transition function $T(sas')$ and rewards $R(s, a)$. This allows for more efficient learning from experience data.
- These are **Model Based RL**.
- Very direct learning from the states and actions; can essentially be [[Supervised Machine Learning]].
- We can convert model into value functions by solving the [[Bellman Equation]] for each state. This is computationally expensive but doable.

#### Planner: 
Converts model into policy.
Assume we have a [[Markov Decision Process]], which is modelled with Transitions $T(sas')$ and Rewards $R(s,a)$. Use this to determine the optimal policy.
- [[Value Iteration]] or [[Policy Iteration]].

#### Learner
Develop a policy directly using only the Transitions data $T(sas')$ and no assumptions.  Model Free. Direct and simpler, but perhaps not as powerful.
- [[Q-Learning]]
- [[SARSA]]
- [[Deep Q-Learning]]

### Simulator
Convert a pre-existing Model and use it to simulate new data (SARS')$\hat.$
- [[Experience Replay]]
- Dyna bit from [[Dyna-Q]]

### RL Pipelines
1. Transition Data (SARS') $\rightarrow$ Modeller $\rightarrow$ Model $\rightarrow$ Planner $\rightarrow$ Policy $\pi$
	1. This is "model-based reinforcement learning", since we learn a model.
2. Model $\rightarrow$ Simulator $\rightarrow$ Transition Data $\rightarrow$ Learner $\rightarrow$ Policy $\pi$
	1. RL-based Planning
	2. Example: TD-Gammon Player for Backgammon
		1. We have lots of different states (e.g., continuous states) so the [[Q-Learning]] table isn't enough
		2. Trained a [[Artificial Neural Network|ANN]] as the learner based on simulated results from  [[Temporal Difference Learning]] 

## In Practice
- You probably need to learn about the environment from [[Supervised Machine Learning]], where you learn from one part of the space to generalize to other parts.

---
# Examples:

## [[Markov Decision Process]]

#### Robot Navigation / Grid World

Grid World is a matrix of states which have unique properties:
- Start
- End / Goal
- Penalty Squares
- Obstacles

Robot can take the following actions:
- Move Up/Down/Left/Right (note that this is dependent on world boundaries)
- Often times, we model actions being *non-deterministic*, e.g., a 20% chance that robot movement will not follow input movement.

Robots act in a "sense, think, act" cycle.
1. Robot senses the environment. (Gridworld with obstacles)
2. Robot thinks about which action(s) to do (calculate policy $\pi$)
	1. Actions are stuff like movement directions.
	2. Determine policy via rewards over time.
3. Robot acts on environment to get to new state.

Rewards scheme affects movement behaviours:
- $R(s)=-0.04$, i.e., small punishment at each state until final states. This encourages faster solutions.
- $R(s)=2$, i.e., stay around because terminal state reward of $1$ is worse.
- $R(s)=-2$, i.e., end yourself as fast as possible because bad terminal state punishment of $-1$ is not as bad.

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

GaTech ML4T
GaTech ML
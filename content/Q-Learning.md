---
aliases: 
tags:
  - ds/ml/rl
edited: 2025-03-15T21:37
created: 2024-03-19T22:06
---
# Definition:
A model-free approach for [[Reinforcement Learning]] that builds up policies using a "Q-Function". Q-function tracks the value of taking action $a$ at state $s$ for all actions and states. in  a Q-Table $Q(s, a)$. We get the policy by picking the best value at each state:
$$\pi^*(s) = \underset{a}{\arg\max}\ Q(s,a)$$

Note that this Q-value includes both immediate **and future** reward (discounted).

---
# Notes:

Theoretically guaranteed to *eventually* find the best policy!

#### Training Procedure
1. Train / Test Split
2. For each time $t$, we get our experience tuple of state, action, new state, and reward: $(s, a, s', r)$
3. Iterate over training data
	1. Set start time, initiate $Q$ function (e.g., as a table of random numbers)
	2. Observe features $s$
	3. Select $a$
	4. Observe $r, s'$
	5. Update $Q$ based on this information. 
		1. $Q'(s, a) = (1-\alpha)*Q(s, a) + \alpha * \hat{v}$ where $\hat{v}$ is the improved estimate of the value based on the new data.
		2. $\hat{v} = r + \gamma * Q(s', \underset{a'}{\arg\max}(Q(s', a')))$,
			1. the current reward $r$ 
			2. plus the discounted $\gamma$ Q-value at next state $s'$ if we take the best predicted action at next state $\underset{a'}{\arg\max}(Q(s', a'))$
			3. Remember that $Q$ already holds our best predicted values for the rewards of each action at each state, so there's no need for anything else!
4. Test policy $\pi$
5. Repeat until reward fails to improve with additional training

#### Randomization for Explore-Exploit
1. Q-Learning must begin by exploring the possible action space $s, a$.
2. Use random actions with some probability $r=0.3$ at start.
3. As we gain more information (i.e., more iterations), the random actions should be used less and less.
4. For more about Explore-Exploit, see [[Multi-armed Bandit]]

---
# Examples:
Examples

----
# Source:
Source
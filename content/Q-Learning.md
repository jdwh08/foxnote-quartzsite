---
aliases: 
tags:
  - ds/ml/rl
edited: 2025-07-26T16:07
created: 2024-03-19T22:06
---
# Definition:
A model-free learner approach for [[Reinforcement Learning]].

Given empirical data, builds up policy using a "Q-Function". Q-function tracks the final value of taking action $a$ at state $s$ for all actions and states. Values stored in a Q-Table $Q(s, a)$. 

We get the policy by picking the best value at each state:


\pi^*(s) = \underset{a}{\arg\max}\ Q(s,a)$



Note that this Q-value includes both immediate **and future** reward (discounted).

This allows us to directly estimate the [[Bellman Equation]]s for [[Markov Decision Process]] from data.

---
# Notes:

### Q Learning Algorithm Family Design Assumptions
1. How do we initialize our $\hat{Q}$?
	1. E.g., if we set unknown values high, we reward search (like in [[A-Star]]).
2. How do we decay our learning rate $\alpha_t$ over time?
3. How do we choose our actions to take?
	1. Exploit? Always choose best $\alpha$. Note this is [[Greedy Algorithm]], but can have local optima. We can't try new things. Can have issues if bad initialization.
	2. Explore? Always choose randomly, but then we don't consider what we learned.
	3. [[Randomized Optimization]] with [[Simulated Annealing]] is pretty good!

#### Convergence Requirements
Our update rule will converge to the true $Q(s,a)$ if...
1. We visit $s, a$ infinite times 
2. Our learning rate $\alpha$ decays over time: $\sum_t{a_t}=\infty,\ \sum_t{\alpha_t^2} < \infty$, e.g., $\alpha = 1/t$.
3. Our world is real, i.e., next states $S' \sim T(sas')$ and rewards are $r \sim R(s)$

Then, theoretically guaranteed to *eventually* find the best policy!

##### Action Taking [[Explore-Exploit]]: $\epsilon$-Greedy
1. Q-Learning must begin by exploring the possible action space $s, a$.
2. Use random actions with some probability, e.g., $r=0.3$ at start.
3. As we gain more information (i.e., more iterations), the random actions should be used less and less.

### Theory from [[Markov Decision Process]]
- We can calculate our [[Utility]] for a state $S$ from
	- Where $R$ is reward, $\gamma$ is discount factor, $S'$ is new states given best action, we sum across transition probability times new state utility


U(s) = R(s) + \gamma \max_{a} \sum_{s'} T(sas') U(s')$



- Instead of [[Utility]] based on state, we can instead use a **Q-Function**


Q(s,a) = Q(s,a) + \alpha \left[ R(s, a) + \gamma \underset{a'}{\max} Q(s', a') - Q(s,a)\right]$


- This calculates the value **for some state S and action A**.
- **After forcing action** $A$, we then consider all future states $s'$ and then **return to most optimal known action(s)** $a'$
- Note that we need some way to estimate our transition function $\hat{T}(sas')$
- Also notice that we use $\max_a Q(s,a)$.
	- Unlike [[SARSA]], we are essentially [[Greedy Algorithm|greedy]] picking the best action to take for all future events.
	- When we are going through Q-Learning we are **not always picking the best action to take based on known Q-values**. E.g., we are sometimes picking 
	- This is [[Off Policy Reinforcement Learning]], i.e., it differs from how we actually train Q-Learning ($\epsilon$ greedy so occasional random exploration)

#### Conversion to [[Utility]] and Policy:
- We can get the utility function by forcing the optimal action $a$: $U(s) =\underset{a}{\max} Q(s,a)$
- We can get the policy by always picking the optimal action $a: \pi^*(s) = \underset{a}{\arg\max}\ Q(s,a)$

### Training Procedure
1. Train / Test Split
2. For each time $t$, we get our experience tuple of state, action, new state, and reward: $(s, a, s', r)$
3. Iterate over training data
	1. Set start time, initiate $Q$ function (e.g., as a table of random numbers)
	2. Observe features $s$
	3. Select $a$
	4. Observe $r, s'$
	5. Update $Q$ based on this information. 
		1. $\hat{Q}'(s, a) = (1-\alpha)*\hat{Q}(s, a) + \alpha * \hat{v}$ where $\hat{v}$ is the improved estimate of the value based on the new data.
			1.  $\alpha$ as learning rate between old and new data.
			2. Repeatedly sampling our values with a learning rate approaches the true [[Expected Value]], so long as the learning rate sums to infinity but learning rate squared is sub-infinite.
		2. $\hat{v} = r + \gamma * Q(s', \underset{a'}{\arg\max}(Q(s', a')))$,
			1. the current reward $r$ 
			2. plus the discounted $\gamma$ Q-value at next state $s'$ 
				1. If we take the best predicted action at next state $\underset{a'}{\arg\max}(Q(s', a'))$.
				2. For alternative not using [[Greedy Algorithm]] here, see [[SARSA]].
			3. Remember that $Q$ already holds our best predicted values for the rewards of each action at each state, so there's no need for anything else!
			4. This does approach the expected value: $R(s) + \gamma E_{s'}\left[ \max_{a'} \hat{Q}(s', a') \right]$ (though proof not rigorous)
4. Test policy $\pi$
5. Repeat until reward fails to improve with additional training

---
# Examples:
Examples

----
# Source:
GaTech ML
Watkins 1989
RL Sutton Barto
---
aliases: 
tags:
  - ds/ml/rl
edited: 2025-07-19T20:14
created: 2024-03-19T22:06
---
# Definition:
A model-free learner approach for [[Reinforcement Learning]].
- Learn optimal policy direct from Experience Data (State Action Reward State Action)

Similar to [[Q-Learning]] in that we have a "Q-Function" keeping track of Q(S, A) [[Utility]] value.

However, **SARSA is "[[On Policy Reinforcement Learning]]"**, i.e., Q-Value for current action by assuming we stick to the policy throughout. 
- Q-Learning assumes all future actions will maximize Q (i.e., greedy); this is not our policy during training so Q-Learning is [[Off Policy Reinforcement Learning]].

---
# Notes:

### Theory from [[Markov Decision Process]]
- We can calculate our [[Utility]] for a state $S$ from
	- Where $R$ is reward, $\gamma$ is discount factor, $S'$ is new states given best action, we sum across transition probability times new state utility


..U(s) = R(s) + \gamma \max_{a} \sum_{s'} T(sas') U(s')$



- Instead of [[Utility]] based on state, we can instead use a **Q-Function** like in [[Q-Learning]].


..Q(s,a) = Q(s,a) + \alpha * \left[ R(s,a) + \gamma Q(s',a') - Q(s,a) \right]$


- This calculates the value **for some state S and action A**
	- We have a learning rate $\alpha$ that controls how much new info is valued.
	- Notice the $\gamma Q(s',a') - Q(s,a)$ is basically tracking how different our new Q is compared to the current estimate, i.e., [[Temporal Difference Learning]] with $TD(0)$
- **After forcing action** $A$, we then consider all future states $s'$
	- Q-Learning Q-values pretend future actions $a'$ will be found $\arg\max Q$ (greedy).
	- Note in [[Q-Learning]] we need *some exploration* to handle the [[Explore-Exploit]] tradeoff, e.g., [[Simulated Annealing]] via epsilon-greedy.
	- Thus, our Q-estimates are actually **OFF POLICY!**
- **SARSA wants us to use our policy to handle explore-exploit everywhere, instead of switching to greedy in the future**.
	- I.e., $a'$ should be chosen via the same epsilon-greedy [[Simulated Annealing]] process.
	- SARSA better reflects agent performance during the training process
	- Q-Learning better reflects agent performance if we switch to greedy afterwards.



---
# Examples:
Examples

----
# Source:
Source
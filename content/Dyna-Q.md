---
aliases: 
tags:
  - ds/ml/rl
edited: 2025-03-16T12:41
created: 2024-03-19T22:06
---
# Definition:
A simple architecture to allow agents to "plan" by simulating actions results with a model.

Simulating actions is cheap relative to interacting with the real world, so Dyna-Q gets more "juice" from each real experience.

We plan using [[Q-Learning]], particularly the Q-Table version of the approach.

---
# Notes:

```psuedocode
Initialize Q(s,a); Model(s,a) for all states s and actions a

while true:
	s = current state
	a = eps-greedy(s, q) (i.e., greedy but random @ eps)
	take action a to get sars'
	update Q(s, a) like in q-learning
	update Model(s, a) using r, s' (assume determistic!)

	for i in n:
		s = random previously seen state
		a = random previous action from s
		r, s' = Model(s, a)
		update Q(s, a) like in q-learning
```

### Planning Method:
- One-step [[Q-Learning]].
- Assumes environment is deterministic.
- From transition $s_t, a_t \rightarrow r_{t+1}, s_{t+1}$ records in $(s_t, a_t)$ the best outcome from $r_{t+1}, s_{t+1}$.

### Simulated Experience
- Crucially, [[Dyna Agents]] simulate experience.
	- Real experiences ($sars'$) are used to build model
	- "Search Control" process selects starting states and actions for simulated experience from model. (here, we're [[Greedy Algorithm]])
	- This produces simulated experiences.
	- RL is applied on simulated experience as a [[Synthetic Data]] for training.
- Same Q-learning is used for both learning from real experience and simulated experience.
	- This simulated experience is essentially "planning" (use model to create policy)
- For Dyna-Q with table, this is essentially like sampling randomly seen past actions.


---
# Examples:
Examples

----
# Source:
From Rich Sutton

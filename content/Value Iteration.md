---
aliases: 
tags:
  - ds/ml/rl
edited: 2025-07-20T19:34
created: 2024-03-19T22:06
---
# Definition:
Solving a [[Bellman Equation]] for [[Reinforcement Learning]] by repeatedly re-calculating the utility values until they converge.

([[Dynamic Programming]])

---
# Notes:

#### Solving a [[Bellman Equation|Bellman]] with Value Iteration

1. Start with some arbitrary utility values. $\hat{U}_t$
2. Update the utility value based on the action(s) and future states that we can take, along with their estimated utility values
3. Repeat until convergence (no more significant changes in values).

$$\hat{U}(s)=\max_a \sum_{s'} T(sas') \left[ R(s,a) + \gamma \hat{U}_t(s') \right]$$
###### Convergence
With some requirements, Policy Evaluation is guaranteed to converge to the optimal value function $V^*$ and policy $\pi^*$, just like [[Policy Iteration]].
- Finite states and actions
- Learning rate $\gamma$ between $0 \le \gamma < 1$.

Practically speaking, the two should arrive at the same answer (except for things like tiebreaks or intermediate results.)

###### Why is this valid and converging?
- We're slowly incorporating the true rewards $R(s)$ each time.
- Note that $\max f(a) - \max g(a) \le \max (f(a)-g(a))$
- Consider change in Bellman over time, as measured by [[Supremum Norm]]:
	- $U(s_i)-U(s_j) = \gamma(\max_a \sum T(s_ias_i')\ \hat{U}(s_i') - \max_a \sum T(s_jas_j')\ \hat{U}(s_j'))$
	- This must be no more than $\gamma \max (\hat{U}(s_i') - \hat{U}(s_j'))$
	- We can see thanks to discount factor $\gamma$ that we tighten each time (?)

###### Why repeat until good enough?
- Note that our goal is to learn the policy $\pi$, not the utilities $U$
- So long as we get the ordering correct for utilities to pick the optimal actions, we're good!

Note that we can "shortcut" this somewhat by not needing the final utility values. For this, see [[Policy Iteration]].

---
# Examples:
Examples

----
# Source:
GaTech ML
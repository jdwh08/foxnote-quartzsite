---
aliases: 
tags:
  - ds/ml/rl
edited: 2025-07-20T19:28
created: 2024-03-19T22:06
---
# Definition:
Solving a [[Bellman Equation]] for [[Reinforcement Learning]] by repeatedly re-calculating the optimal policy until it converges.

([[Dynamic Programming]])

---
# Notes:

#### Shortcut with Policy Iteration
1. **Policy Evaluation**: Get the policy $\pi$ (e.g., initial guess, or by maximizing utilities, etc.)
	1. Calculate utilities $\hat{U}_t$ based on the policy $\pi$.



..U_t(s) = \sum_a \pi(a|s) \sum_{s'} T(sas')\left[R(s,a)+\gamma U(s') \right]$


2. **Policy Improvement**: Update the policy to account for the new utilities. 



..\pi(a|s)=\underset{a}{\arg\max} \sum_{s'} T(sas')\left[ R(s,a) + \gamma U(s') \right]$



3. Repeat until convergence (no more changes in policy).


- This is different because we plug in the policy $\pi_t(s)$ for the action instead of figuring it out via $\max_a$ over values
- Removing the max means this is now a set of linear equations for each state!

Note to get the utility values we can use [[Value Iteration]].

###### Convergence
With some requirements, Policy Evaluation is guaranteed to converge to the optimal value function $V^*$ and policy $\pi^*$, just like [[Value Iteration]].
- Finite states and actions
- Learning rate $\gamma$ between $0 \le \gamma < 1$.

Practically speaking, the two should arrive at the same answer (except for things like tiebreaks or intermediate results.)

---
# Examples:
Examples

----
# Source:
GaTech ML
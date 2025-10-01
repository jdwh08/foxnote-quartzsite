---
aliases: 
tags:
  - stats/probability
  - stats/time_series
edited: 2025-07-03T15:16
created: 2024-03-19T22:06
---
# Definition:
A [[Stochastic Process]] where future changes are independent of the past.

Very useful to be able to mathematically solve problems.

---
# Notes:

### Formal Definition

Suppose we have some [[Probability Space]]:
- $\Omega$ (options), $\mathcal{F}$ (events), $P$ (probabilities) 
- It's a [[Filtration (Probability)]], i.e., ordered information over times $\in I$

Our probability space has a [[Stochastic Process]] going from state to state $(S, \mathcal{\hat{S}})$: $X = \{X_t: \Omega \rightarrow S\}_{t \in I}$

Process has Markov Property if $\forall$ states $A\in \mathcal{\hat{S}}$ and times $s, t \in I$ where $s<t$...


..P(X_t \in A | \mathcal{F}_\mathcal{\hat{s}}) = P(X_t \in A | X_\mathcal{\hat{s}})$


i..e, probabilities for $X_t$ depend only on the present state $X_s$, not any of the prior  information in the filtration $\mathcal{F}_s$.

#### Discrete Case


..P(X_{n+1} = x_{n+1} | X_1=x_1, X_2=x_2, ... X_n = x_n) = P(X_{n+1}=x_{n+1} | X_n=x_n)\ \forall\ n \in I$



### A Markov Conversion "Hack"
- We can kinda make a non-Markov processes Markov-like by making the "current state" also incorporate all the past information needed. 
- However, this limits the amount of states available

---
# Examples:
Examples

----
# Source:
GaTech ML
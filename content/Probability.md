---
aliases: 
tags:
  - stats/probability
edited: 2025-02-15T16:12
created: 2024-03-02T19:21
---
### Definition:
A probability measure is a function which maps an [[Sample Space and Events|event]] $A\in\mathcal{A}$ to a number in \[0,1\]. $P: \mathcal{A}\rightarrow[0,1]$ such that
- $0\leq P(A)\leq1$ for all events $A\in\mathcal{A}$ (i.e., probability can't be higher than 1)
- $P(S)=1$ (i.e., total [[Sample Space and Events|sample space]] has probability 1)
- If $A_1, A_2, ...,$ and $A_i \cap A_j =  \emptyset \ \forall \ i\neq j$, then $P(\bigcup_{i=1}^\infty A_i) = \sum_{i=1}^{\infty} P(A_i)$. (i.e., if there is no intersection, the probability of the union is the sum.)

---
### Notes:
- Complement rule tells us that to find the complement probability you can take $1-P(A)$.
- General Addition Rule tells us that $P(A\cup B)=P(A) + P(B) + P(A\cap B)$
- Partition Rule tells us that $P(A)=P(A \cap B)+P(A \cap B^c)$ (i.e., we can partition A into the space in B and not in B).
- Containment Rule tells us that if $A\subseteq B$ then $P(A) \leq P(B)$
---
### Examples:
Examples
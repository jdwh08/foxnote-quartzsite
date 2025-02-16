---
aliases: 
tags:
  - math
  - math/proof
edited: 2025-02-15T16:33
created: 2024-01-05T20:01
---
### Definition:
This is similar to [[Proof by Induction]] except our assumption is even stronger.

1. For the predicate that you want to prove, check that some base case is true. 
2. Next, assume that the predicate is true at all steps up to $n$: $P(0)$ to $P(n)$, not just that $n$ case like in [[Proof by Induction]].
3. Use this to prove that it works for the $n+1$ step.
4. Conclude that it works for all natural numbers $\geq$ the base case by the Principle of Mathematical Induction.

---
### NOTES: 
This is especially helpful in conditions where we could be incrementing by different amounts than 1, e.g., the "Unstacking Game"
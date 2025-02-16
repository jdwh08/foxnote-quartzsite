---
aliases: 
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-09T19:45
---
### Definition:
A way to find a [[Relatively Prime]] number in [[Modular Arithmetic]].
If $p$ is prime and $k = \{ 1,\ldots,p - 1\}$ then $k^{p - 1} \equiv 1(mod\ p)$

---
### Proof:
Since $p$ is prime, all the possible numbers in $k$ are relatively prime to p.
Thus, the number of primes in the set for k is the exact same thing as [[Euler's Totient Function]]. 
-   Thus, $k^{p - 1} \equiv 1(mod\ p)$.

---
### Examples:

Consider $k*k^{p - 2} = k^{p - 1} \equiv 1(mod\ p)$. 
This means that $k$ and $k^{p - 2}$ are multiplicative inverses by definition!
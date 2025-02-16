---
aliases: 
tags:
  - math/proof
edited: 2025-02-15T16:34
created: 2024-01-05T19:06
---
### Definition:

Suppose there is a set C which contains positive natural numbers. Then the Well Ordering Principle states that C must have some minimum element $c_0$ Typically prove this by contradiction, looking for the set of elements which are not true, exploiting $c_0$  as a minimum element, then finding some $c$ which is smaller than $c_0$.

---
#### NOTES: 
1. You can also do it the other way where you say there is some maximum element IF you prove it exists.
2. Every proof by WOP can also be rewritten as a [[Proof by Induction]].

---
### Example:

Every Natural Number can be factored as a product of primes
- Assume this is false. Let $C$ be the set of integers above 1 that cannot be factored. This should not be empty by assumption.
- There must exist some smallest element $n$ by the WOP. This $n$ can’t be prime since a prime is factored as $1*p$.
- Thus, $n$ must be some product of integers $1<a,b<n=min(c)$ which implies $a,b$ not in $c$ because they are smaller.
- Because $a,b$ are not in $C$, they can be factored into primes (e.g., $a = p_{a1}*...*p_{ak}$).
- $n=a*b=(p_{a1}*...*p_{ak}) * (p_{b1}*...*p_{bk})$ but this is a contradiction!
- Thus our assumption that $C$ is not empty is false.
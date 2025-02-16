---
aliases: 
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-07T20:09
---
### Definition:
Congruence $a \equiv b(mod\ n)$ means that [[Quotient and Remainder|remainder]]$(a,n) = remainder(b,n)$.
- This also implies that $a \equiv (kn + b)(mod\ n)$ because $kn(mod\ n) = 0$, so the remainder is just $remainder(b,n) = b(modn)$.
- This also implies that $a - b \equiv kn \rightarrow n\ |\ (a - b)$
	- NOTE: $n > 1$ otherwise things don't make much sense.
---
### Notes:
Building block of [[Modular Arithmetic]].

Properties of Congruence as a [[Mathematical Relation]]:
- $a \equiv a$ or [[Reflexive]]
- $a \equiv b\ \text{iff}\ b \equiv a,$ or [[Commutative]]
- $a \equiv b\ \&\ b \equiv c \rightarrow a \equiv c$, or [[Transitive]]
- This means that congruence is a [[Equivalence Relation]].

Congruence as an Equivalence Relation:
- $a \equiv remainder(a,n)\ (mod\ n)$ 
	- We can kind of think of this as dividing the integers into a
        bunch of different sets where each set has the same remainder
        after dividing by n.
	- We can make a "ring of integers mod n" or "ring of modulus"
        where addition and multiplication within that ring hold. (e.g.,
        $(a + b)m = am + bm\ (mod\ n)$. This is called $\mathbb{Z}_{n}$.
	- These are the [[Equivalence Classes]] for congruence.

Properties of Congruence from the [Divisibility rules](https://math.stackexchange.com/questions/879251/congruence-arithmetic-laws-e-g-in-divisibility-by-7-test/879262#879262):
-   If $A \equiv a\ (mod\ m)$ and $B \equiv b\ (mod\ m)$
    -   $A + B \equiv a + b\ (mod\ m)$
    -   $AB \equiv ab\ (mod\ m)$
    -   $A^{n} \equiv a^{n}\ (mod\ m)$, but not $A^{B} \rightarrow a^{b}$.

---
### Examples:
Examples
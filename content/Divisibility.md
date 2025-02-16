---
aliases:
  - Divides
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-05T20:53
---
### Definition:
A divides B, or `A | B` if **$\mathbf{ak = b}$** for some b. 
- "B is a multiple of A"

---
### Notes:

##### Properties:
- If A | B then A | BC for all C.
- If A | B and B | C then A | C.
- If A | B and A | C then $A\ |\ (sB + tC)$ for all $s$ and $t$.
- For all $c \neq 0, a\ |\ b$ IFF $ca\ |\ cb$.
	- Example Proof: Assume A \| B and B \| C. Since A \| B, there exists $k_{1}$ such that $Ak_{1} = B$. There also exists $k_{2}$ such that $Bk_{2} = C$.  Thus, $\left( Ak_{1} \right)k_{2} = c \rightarrow A\left( k_{1}k_{2} \right) = c \rightarrow A\ |\ c$.

---
### Links

Building block of [[Number Theory]], so all the numbers above are integers.

Divides can also be thought of as a [[Mathematical Relation]].
- It is [[Reflexive]]
- It is [[Anti-Symmetric Relation]]
- It is [[Transitive]]
- This implies it is a [[Partial Order]].
---
### Examples:
Examples
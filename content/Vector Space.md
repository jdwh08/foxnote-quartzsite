---
aliases: 
tags:
  - math/linear_algebra
edited: 2025-02-15T16:15
created: 2024-04-09T19:36
---
### Definition:
A vector space is a set $S$ which is "closed under addition and scalar multiplication".
- We can pick any two vectors in the set $S$, and add them together using Vector Addition, and the resulting vector will be in $S$ still.
- We can multiply any vector in $S$ by a scalar/constant $c$ and still have the result be in $S$.

Additional Properties:
- Commutativity of addition: $u+v=v+u$
- Associativity of addition: $(u+v)+w=u+(v+w)$
- Additive Identity: There exists some 0 in $S$ so that $v+0=v$ 
- Additive Inverse: There exists some $-v$ in $S$ so that $v+-v=0$.
- Associativity of Multiplication: $c_1(c_2 v)=(c_1 c_2)v$
- Distributive: $c_1(u+v)=c_1 u + c_1 v$.

---
### Notes:
Framework for handling linear algebra operations and more complicated structures like [[Hilbert Spaces]].

---
### Examples:
- The set of all two-dimensional vectors, with vector addition corresponding to component-wise addition and scalar multiplication scaling the vectors.
- The set of all polynomials of a certain degree or less.
- Function spaces, where vectors are functions.
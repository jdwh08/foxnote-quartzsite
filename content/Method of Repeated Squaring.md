---
aliases: 
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-09T20:05
---
### Definition:
Way to reduce [[Multiplicative Inverse (Modular Arithmetic)|Multiplicative Inverses]] to not exceed the base number.
Rewrite the larger number into binary-like representation, and then take the modulus there.

---
### Examples:
What is $17^{29}\ (mod\ 31)$?
- $17^2 = 289$, and $289\ (mod\ 31) \equiv 9*31 + 10 \equiv 10$
- $17^4 = {17^2}^2$, so $\equiv 10^2 \equiv 3*31 + 7 \equiv 7$
- $17^8 = {17^4}^2$, so $\equiv 7^2 \equiv 31 + 18 \equiv 18$
- $17^{16} = {17^8}^2$, so $\equiv 18^2 \equiv 324 \equiv 14$
- $17^{29} \equiv 17^{16} * 17^{8} * 17^{4} * 17^{1} \equiv 14*18*7*17 \equiv 2*7*3*3*2*7*17$
- You can divide and conquer this by taking the mod 31 of smaller chunks (e.g., $2*7*3 = 42 \equiv 11$)
- Eventually, you get the result of 11.
---
### Notes:
Very useful for simplifying the results from [[Euler's Theorem]] or [[Fermat's Little Theorem]], since those tend to output numbers with *huge* exponents.
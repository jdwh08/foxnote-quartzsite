---
aliases: 
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-05T21:26
---
### Definition:
Method of finding the [[Greatest Common Divisor]] of two integers by repeatedly finding the GCD of the [[Quotient and Remainder|remainder]].

---
### Examples:
- $gcd(1147, 899) = gcd(899, rem(1147,899))$
	- Find the remainder $rem(1147,899)=248$ and repeat the pattern once again
- $= gcd(248, rem(899,248))$
- $= gcd(155, rem(248, 155))$
- $= gcd(93, rem(155, 93))$
- $= gcd(62, rem(93, 62))$
- $= gcd(31, rem(62, 31))$
- $= gcd(31, rem(0, 31)) = gcd(31,0) = 31$

---
### Notes:
Related to [[The Pulverizer]].
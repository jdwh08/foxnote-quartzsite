---
aliases: 
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-09T19:12
---
### Definition:
Alternative way to calculate the [[Euler's Totient Function]].

Breaking down $n$ into prime factors $p_1\ldots p_k$
$\phi(n) = n(1 - \frac{1}{p_{1}})(1 - \frac{1}{p_{2}})\cdots(1 - \frac{1}{p_{k}}).$

---
### Examples:
$\phi(12) \rightarrow 2*2*3 \rightarrow 12*\left( 1 - \frac{1}{2} \right)*\left( 1 - \frac{1}{3} \right) = 4$

---
### Notes:
We can think of this as saying: consider the first prime factor $2$. Since $2$ is a prime, half the numbers (all odds) are now not prime since it's divisible by 2. This leaves $1 - \frac{1}{2}$ numbers left.
-   Repeat the logic for all other factors.

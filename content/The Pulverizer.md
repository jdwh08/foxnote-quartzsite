---
aliases:
  - Extended Euclid's Algorithm
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-05T21:41
---
### Definition:
Basically the same as [[Euclid's Algorithm]], but we keep a record of the [[Linear Combination]]s of x, y that we used to get to the result. 

Also known as the Extended Euclid's Algorithm.

---
### Examples:

Find the [[Greatest Common Divisor]] of 259 and 70 along with the linear combination used to make it. 

| $x$ | $y$ | $rem(x,y)$ | $rem=x-q*y$ |
| ---- | ---- | ---- | ---- |
| 259 | 70 | 49 | $49=259-3*70$ |
| 70 | 49 | 21 | $21=70-1*49$ |
|  |  |  | $21 = 70 - 1*(259-3*70)$ |
|  |  |  | $21 = -1*259 + 4*70$ |
| 49 | 21 | 7 | $7=49-2*21$ |
|  |  |  | $7=(259-3*70)-2*(-1*259 + 4*70)$ |
|  |  |  | $7=3*259-11*70$ |
| 21 | 7 | 0 | Done! Answer is above. |
Thus, $GCD(259,70)=7$, and it can be formed as $7=3*259-11*70$.

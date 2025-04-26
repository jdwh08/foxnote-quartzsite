---
aliases: 
tags: []
edited: 2025-03-11T20:59
created: 2024-03-19T22:06
---
# Definition:
Combining assets which are anti-correlated to each other results in better risk adjusted returns than holding assets separately. 

---
# Notes:
Consider different assets: A, B, C.

A, B, C have returns of 10%.
They also have this [[Covariance Matrix]]:

|       | A    | B   | C    |
| ----- | ---- | --- | ---- |
| **A** | 1    | 0.9 | -0.9 |
| **B** | 0.9  | 1   |      |
| **C** | -0.9 |     | 1    |

Because A, C are strongly anti-correlated, the losses from A are smoothed by the losses from C, and vice versa. Thus, return is 10% but [[Standard Deviation]] of returns ([[Volatility]]) is much smaller.

---
# Examples:
Examples

----
# Source:
From Harry Markowitz.


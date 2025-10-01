---
aliases: []
tags:
  - math/calculus
edited: 2025-08-18T20:37
created: 2024-03-19T22:06
---
# Definition:
A method to undo the [[Chain Rule]] for [[Integration]] by splitting the integral into two pieces, one of which is easier to integrate.

---
# Notes:

$$\int u\ dv = uv - \int v\ du$$

- We generally want to set $u$ to be something easy to differentiate, and $dv$ something easy to integrate, since we need to solve for $du$ and $v$ respectively. 
- Don't forget that technically speaking the $uv$ portion is $uv |_l^r$, i.e., evaluated at the bounds. Watch out for integration by parts formulas which result in an undefined solution like $\infty - \infty$.

---
# Examples:
Examples

----
# Source:
Source
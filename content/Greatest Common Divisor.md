---
aliases:
  - math_gcd
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-05T21:13
---
### Definition:
Largest number that is divisor of a and b. (i.e., the GCD [[Divisibility|Divides]] a and b).

---
### Examples:
$gcd(18,12)=6$ since $18=6*3$ and $12=6*2$, and there are no common factors which are larger.

---
### Notes:

$GCD(a,b)$ is always the smallest possible [[Linear Combination]] of $a, b$.
- [[Proof by Well Ordering Principle]]
	- By WOP, this set of linear combos has some smallest possible $m$.
	- Any common divisor of $a$ and $b$ will also divide $sa$ and $tb$.
	- Thus, gcd(a,b) \| $sa + tb$ for all s and t.
	- Since $m$ is a linear combo it falls within $sa + tb$, so gcd divides m, so m must be larger than or equal to gcd.
	- By division, we can have some quotient and remainder so $a = qm + r$
	- This implies  $\rightarrow a = q(sa + tb) + r \rightarrow r = (1 - qs)a - qtb$
	- $r$ is a linear combo of a and b, but $m$ is the smallest positive linear combo and $0 \leq r < m$ by division, so $r = 0$, so $m|a$.
	-   Repeat for b.
	-   Thus, $m$ must be the GCD because it divides $a$ and $b$.

##### Properties of the GCD:
1. Every common divisor of a and b [[Divisibility|Divides]] the GCD.
2. GCD is scalar: $\gcd(ka,kb) = k*gcd(a,b)$
3. If $\gcd(a,b) = 1$ and $\gcd(a,c) = 1$ then $\gcd(a,bc) = 1$.
4. If $a\ |\ bc$ and $\gcd(a,b) = 1$ then $a\ |c$.
5. $\gcd(a,b) = gcd(b,$ _[[Quotient and Remainder|remainder]]_$(a,b))$

Prove these by converting GCD to linear combinations, and then use [[Linear Combination]] properties to convert back.
- Proof of #3: Because GCD is a linear combo, there must exist $sa + tb = 1$, and $ua + vc = 1$, so $(sa + tb)(ua + vc) = 1$, so $a(asu + btu + csv) + bc(tv) = 1$. We see this is a linear combo with a and $bc = 1$.
- Proof of #4: Because $a|a$ and $a|bc$ by assumption, $a$ divides every linear combo of $ac$ and $bc$, including $\gcd(ac,bc) = c*\gcd(a,b) = c*1 = c$.

---
### Links:

[[Euclid's Algorithm]] and also [[The Pulverizer]] says that we can repeatedly apply the $\gcd(a,b) = gcd\left( b,remainder(a,b) \right)$ on the remainder bit too.

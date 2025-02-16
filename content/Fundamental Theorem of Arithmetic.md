---
aliases: 
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-06T09:17
---
### Definition:
Every positive integer $n$ can be uniquely written as a product of primes.
-   (we assume 1 is not prime, and that the empty set has product 1).

---
### Notes:
-   Lemma: If p is prime and p \| ab then p \| a or p \| b. (See [[Divisibility|Divides]] for \|).
    -   [[Greatest Common Divisor|GCD]] of a and p is either 1 or p since p is prime.
    -   If GCD is p then p \| a.
    -   If GCD is 1 then p \| b from before.
        -   [[Greatest Common Divisor|GCD property 4]]: If $a\ |\ bc$ and $gcd(a,b)=1$ then $a\ |\ c$.

-   Lemma: If p is prime and p \| $a_{1}a_{2}\ldots a_{n}$ then $p\ |\ a_{i}$.
    -   By Induction from the $a_{1}a_{2}$ case.


---
### Proof:
- We proved in [[Proof by Well Ordering Principle]] section that any positive can be a product of primes, so we need to prove *uniqueness* here using the WOP.
- Assume there are non-unique positive integers. By WOP, there is a smallest integer with this property, $n$.
	-   $n = p_{1}\ldots p_{i} = q_{1}\ldots q_{j}$.
- Then, $p_{1}\ |\ n$ so $p_{1}\ |\ q_{1}\ldots q_{j}$
- Lemma requires $p_{1}$ divides one of the primes, but they are
	primes so this must mean $p_{1} = q_{k}$ for some k.
- Remove $p_{1}$ and $q_{k}$.
	$\frac{n}{p_{1}} = q_{1}\ldots q_{j}\ /q_{k} \rightarrow$ It can also be written as two different products of primes.
	Contradictions w/ $n$ being smallest.

---
### Examples:
Examples
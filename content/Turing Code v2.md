---
aliases: 
tags:
  - cryptography
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-09T18:14
---
### Definition:
Sender and receiver agree on some public prime $p$, and some secret
prime $k < n$ as a key.
- Encrypt by finding $m_{e} =$ _[[Quotient and Remainder|remainder]]_$(m*k,\ p)$ 
- Decrypt by finding $m = remainder(m_{e}*k^{- 1},\ p)$
	-  $rem(mk,p) \equiv mk(mod\ p)$ by definition of [[Congruence]]
	-  If some $k^{- 1}$ [[Multiplicative Inverse (Modular Arithmetic)|inverse]] exists, then
	    $m_{e}k^{- 1} = m*k*k^{- 1}(mod\ p) = m*1\ (mod\ p)$

---
### Notes:
Issue: "Known-Plaintext Attack"
- If the Nazis get an encrypted and plaintext pair $(m,m_{e})$,
    then $m_{e} \equiv mk(mod\ p)$
- Since p and m are prime, then $\gcd(m,p) = 1$
- Since [[Greatest Common Divisor|gcd]] is smallest linear combo of $m,p$ then $1 = am + bp$
- We can use $p$ and $m$ to compute $m^{- 1}$ since we need to find
    $1 = rem\left( mm^{- 1},\ p \right)$ 
- $rem\left( \gcd(m,p),p \right) = rem(1,p) = 1$ and
    $rem\left( \gcd(m,p),p \right) = rem(am + bp,p) \rightarrow rem(am,p) = 1$
    for some $a$ thus $a = m^{- 1}$.
-  $m_{e}m^{- 1} \equiv k*m*m^{- 1} \equiv k\ (mod\ p)$
- Can compute $k^{- 1}\ (mod\ p)$ with same argument. With $k^{- 1}$,
    we can crack everything using the decryption above.

A slight improvement on the [[Turing Code v1]], but not by much.

---
### Examples:
Examples
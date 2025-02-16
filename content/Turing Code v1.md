---
aliases: 
tags:
  - cryptography
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-06T09:29
---
### Definition:
Method to use number theory to encrypt communications during WW2.
1. Translate a message to integer by replacing the letters with numbers (so A-\>1, Z-\>26).
2. Pad the result with some additional numbers to make it a prime.
3. Agree on a secret key which is a large prime $k$
4. Encrypt with $m_{encrypt} = m*k$
5. Decrypt with $m = m_{encrypt}/k$

---
### Notes:

Issue with Turing's code V1: While factoring primes is not efficient, the Nazis can decode this by finding two encrypted messages: $k =$ [[Greatest Common Divisor|gcd]]$(m_{e1},m_{e2})$ 

Turing later proposed the [[Turing Code v2]].

---
### Examples:
Examples
---
aliases: 
tags:
  - math
  - math/proof
edited: 2025-02-15T16:33
created: 2024-01-05T19:16
---
### Definition:
1. For the predicate that you want to prove, check that some base case is true. 
2. Next, assume that the predicate is true at the $n$ step. 
3. Use this to prove that it works for the $n+1$ step.
4. Conclude that it works for all natural numbers $\geq$ the base case by the Principle of Mathematical Induction.

---
### NOTES: 

Be sure that the base cases are really enough! We want to create an unbroken chain of dominoes.
	1. Example: All horses in a set are the same colour. 
		1. Base: A set with 1 horse obviously has the same colour. 
		2. Induction: Given that sets of $n$ horses with the same colour, let's consider the set of $n+1$ horses. We see that the first $n$ horses have the same colour, and also the set of the last $n$ horses have the same colour. Both these sets overlap, so all the horses must have the same colour.
		3. Thus, the $n+1$ set has the same colour. By the PMI, this is true.
	2. Obviously this is false. The issue is that we didn't check the case for a set of 2 horses!

If an induction proof seems hard to do, try making an even stronger and more specific assumption, e.g., the result is $2n + 1$ instead of just the result is positive. This should give an easier time proving the $n + 1$ case.

Any proof by induction can also be written as a [[Proof by Well Ordering Principle]].

A stronger version where the assumption is all elements up to $n$ is [[Proof by Strong Induction]].

---

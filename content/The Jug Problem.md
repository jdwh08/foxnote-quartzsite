---
aliases: 
tags:
  - math/discrete_math/number_theory
edited: 2025-02-15T16:15
created: 2024-01-05T21:10
---
### Definition:
How do you make $x$ gallons of water from two jugs with $a$ and $b$ gallons? E.g., make 3 gallons from jugs of size 4 and 6?

Lemma 1: Note that that the jug problem forms [[Linear Combination]]s of the jugs...
- [[Proof by Induction]]:
    -   Base case: at $P(0)$, we have the zero vector (0, 0 -\> 0)
    -   Induction assume this is a linear combination at step $n$.
        - If the jug is filled or emptied from the sink, it is either empty (0) or full (a/b). The other jug remains unchanged. TRUE.
        - If the jug is poured into the other jug until one is empty
            or full, then...
            -   $j_{1} = x_{1}*a + y_{1}*b$
            -   $j_{2} = x_{1}*a + \ y_{2}*b$
            -   After pour, one jug is empty or full and thus matches. The other has either
                - $j_{1} + j_{2}$ if first jug is empty
                -  $j_{1} + j_{2} - a$ if first jug is full
                -  $j_{1} + j_{2} - b$ if second jug is full. 
            - All are linear combos, thus TRUE.
- In other words, we can solve the jug problems using the [[Greatest Common Divisor]]!

Corollary: You can't make 4 from 3+6. Jug amounts are always $3*x_{1} + 6*x_{2}$ which is a multiple of 3.

##### A Solution to all Jug Problems:
We can write the possible jug problem amounts as a linear combination of the two starting jugs.
- We can also offset the effects of removing one jug (e.g., $x_1$) by adding some amount of the other jug $x_2$
	- E.g., if the target is $3$ and $x_1=21$ and $x_2=26$ then $26x_1=21x_2$.
	- Thus, if we started off with $3=x_1*21+x_2*26$ , we can still end up with 3 if we add in $26x_1-21x_2$.
	- This is like repeatedly fill the smaller jug into the larger jug and dumping the larger jug out if it is full.
	- Thus, our algorithm is complete!
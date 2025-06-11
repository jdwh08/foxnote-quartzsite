---
aliases:
  - Random Restart Hill Climbing
tags:
  - cs/dsa
  - ds/ml/
edited: 2025-06-09T21:28
created: 2024-03-19T22:06
---
# Definition:
An [[Optimizer]] which gradually guesses within some area until things stop improving.

With Random Restarts, becomes a [[Randomized Optimization]] algorithm.

![[Hill Climbing.png]]

Note: This is an [[Multi-armed Bandit|Exploit]] only [[Greedy Algorithm]] which only tries to improve.

---
# Notes:

### Basic Algorithm
1. Guess $x \in X$
2. WHILE true
	1. Let $n=\underset{n\in N(x)}{\arg\max} f(n)$ (the best value within *neighbourhood* $N(x)$)
	2. If $f(n) > f(x): x=n$ else Break

### Issues
Does not work when the function is not [[Convex Function]], i.e.,. local optima.
You can **get stuck**!

### Random Restart Hill Climbing
1. Randomly choose some new $x$
2. Run Hill Climbing
3. Stop when done.

This allows us to find better starting places.
Hill climbing is not too expensive to run some constant $c$ times.
###### Even More Improvements:
1. Memory  -- keep track of points you've visited already
2. Do faster random restarts

### [[ML Algorithm Bias]]
1. We assume that function reward improvement is smooth in some local area, i.e., there aren't some sudden random spikes at one point.
2. We hope that the area of points which gets "sucked into" the global optima, i.e., the "attraction zone" is large.

---
# Examples:

#### Guess the Bits!
Suppose I have a 5-bit sequence I need you to guess.

1. Given a [[Loss Function]] or [[Reward Function]] $f(x)$: Number of correct bits.
2. Define a neighbour function $N(x)$: One bit differences from $X$.

**R1:** 00000 -> 2
**Neighbours**
10000 -> 3 ** Best Neighbour
01000 -> 1
00100 -> 3
00010 -> 3
00001 -> 1

R2: 10000
**Neighbours**
11000 -> 2
10100 -> 4 ** Best Neighbour
10010 -> 4
10001 -> 2

... etc.

Note that this is a very nice fitness function (one global maxima, you can always move toward it) and we know the space pretty well.

----
# Source:
Source